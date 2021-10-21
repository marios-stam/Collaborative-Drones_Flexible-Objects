import numpy as np
import cv2
from cv2 import bgsegm
import os,sys
current = os.path.dirname(os.path.realpath(__file__))

if (__file__=="/home/marios/catkin_ws/src/thesis_drone/src/Drone_Pose_Estimation/CV_techniques/pose_extractor_CV.py"):
    from .camera_model import Unproject
else:
    from .camera_model import Unproject

from os.path import dirname, abspath
from matplotlib import pyplot as plt
from pandas_ods_reader import read_ods
#if not executed in ROS wokspace the parameters (CAMERA_HEIGHT,CONTOUR_AREA_THRESHOLD) must be defined manually

def add_parent_folder_to_path():
    # getting the name of the directory
    # where the this file is present.
    current = os.path.dirname(os.path.realpath(__file__))
    
    # Getting the parent directory name
    # where the current directory is present.
    parent = os.path.dirname(current)
    
    # adding the parent directory to 
    # the sys.path.
    sys.path.append(parent)

add_parent_folder_to_path()

from utilities import getVideoCap 
from calibration import calibration
import filtering

#cap = cv2.VideoCapture('people-walking.mp4')
#cap = cv2.VideoCapture('Ball_Bouncing.mp4')
cap = cv2.VideoCapture('/home/marios/catkin_ws/src/thesis_drone/src/Drone_Pose_Estimation/test_videos/phone_edited.mp4')
# cap = cv2.VideoCapture(0)



def get_max_contour_area(contours):
    max_area=0
    max_i=0
    for i,c in enumerate(contours):
        if cv2.contourArea(c) >max_area :
            max_area=cv2.contourArea(c)
            max_i=i

    return max_area, max_i

def draw_bounding_box(max_contour,frame):
    x,y,w,h = cv2.boundingRect(max_contour)
    cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255,0), 2)
    center = ( x+w/2 ,y+h/2 )
    
    max_area=cv2.contourArea(max_contour)
    font = cv2.FONT_HERSHEY_SIMPLEX
    cv2.putText(frame, "area:%d"%(max_area),(450,30) ,font, 1, (0, 0, 255),2, cv2.FILLED)
    cv2.putText(frame, "x: %d"%(center[0]), (450,60) ,font, 1, (0, 0, 255),2, cv2.FILLED)
    cv2.putText(frame, "y: %d"%(center[1]), (450,90) ,font, 1, (0, 0, 255),2, cv2.FILLED)
    
    return center

def calculate_pol_for_area_to_depth():
    parent_dir_path = dirname(dirname(abspath(__file__)))
    df = read_ods(parent_dir_path+'/CV_techniques/area_depth_data.ods' , 'Sheet1')
    actual_depths=list( df.actual_distance.values )#cm
    areas=list( df.area.values )

    p = np.polyfit(x=areas, y=actual_depths, deg=3)
    return p

def save_pol_for_area_to_depth(path,pol):
    """ Save the polynomial of the area estimation to given path/file. """
    cv_file = cv2.FileStorage(path, cv2.FILE_STORAGE_WRITE)
    cv_file.write("pol", pol)
    # note you *release* you don't close() a FileStorage object
    cv_file.release()

def load_pol_for_area_to_depth(path):
    """ Loads camera matrix and distortion coefficients. """
    # FILE_STORAGE_READ
    cv_file = cv2.FileStorage(path, cv2.FILE_STORAGE_READ)

    # note we also have to specify the type to retrieve other wise we only get a
    # FileNode object back instead of a matrix
    pol = cv_file.getNode("pol").mat()
    
    cv_file.release()
    return pol

def estimate_z_based_on_contour(contour,p:list)->float:
    area = cv2.contourArea(contour)
    depth=np.polyval(p,area)

    return depth

def get_center_of_contour(contour)->list:
    # compute the center of the contour
    M = cv2.moments(contour)
    cx = int(M["m10"] / M["m00"])
    cy = int(M["m01"] / M["m00"])
    center = [cx,cy]

    return center

class pose_extractor_CV_techniques:
    def __init__(self,camera_height=5,contour_area_thresh=400,use_depth_from_tello=False,USB_cam=1):
        
        # self.cap = getVideoCap(usb=USB_cam)
        self.cap=cv2.VideoCapture('/home/marios/catkin_ws/src/thesis_drone/src/Drone_Pose_Estimation/test_videos/tello_flight1.mp4')
        # self.cap=cv2.VideoCapture('/home/marios/catkin_ws/src/thesis_drone/src/Drone_Pose_Estimation/test_videos/area_depth_79cm.mp4')
        
        parent_dir_path = dirname(dirname(abspath(__file__)))
        params=calibration.load_coefficients(parent_dir_path+"/calibration/cameraCoeffs.yml")
        print(params)
        self.matrix_coefficients,self.distortion_coefficients=params[0],params[1]
        self.background_subtract = cv2.createBackgroundSubtractorMOG2(history = 100, varThreshold = 16, detectShadows =False)
        
        self.z_estimation_polynomial=load_pol_for_area_to_depth(parent_dir_path+'/CV_techniques/pol_area_depth.yml')

        self.actual_height =0
        self.rot = []

        self.filter = filtering.StreamingMovingAverage(window_size=40)

        #parameters
        self.CAMERA_HEIGHT = camera_height
        self.CONTOUR_AREA_THRESHOLD = contour_area_thresh
        self.USE_DEPTH_FROM_TELLO = use_depth_from_tello

    def visualise(self,frame,gblur):
        cv2.imshow('original', frame)
        cv2.imshow('first frame', gblur)

        k = cv2.waitKey(30) & 0xff
        if k == 27:
            self.kill()
        elif k == 32:#spacebar
            k = cv2.waitKey(30) & 0xff
            while not k==32:#spacebar
                k = cv2.waitKey(30) & 0xff

    def estimate_xy_based_on_z(self,point,z):
        xy = Unproject(np.float32( np.array([point,]) ),z,self.matrix_coefficients,self.distortion_coefficients)
        # print("xy from estimation:",xy[0])
        return xy[0]

    def display_real_coords(self,frame,tvec):
        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(frame, "x:%.1f"%(tvec[0]),(40,30) ,font, 1, (0, 0, 255),2, cv2.FILLED)
        cv2.putText(frame, "y:%.1f"%(tvec[1]),(40,60) ,font, 1, (0, 0, 255),2, cv2.FILLED)
        cv2.putText(frame, "z:%.1f"%(tvec[2]),(40,90) ,font, 1, (0, 0, 255),2, cv2.FILLED)

    def getPose(self):
        ret, frame = self.cap.read()

        first_frame = self.background_subtract.apply(frame)
        gblur = cv2.GaussianBlur(first_frame, (5, 5), 0)

        #contouring
        #threshold : Separate out regions of an image corresponding to objects which we want to analyze.
        ret, threshold = cv2.threshold(gblur, 200, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)

        # Thresholding Technique - cv2.THRESH_BINARY,cv2.THRESH_BINARY_INV,cv2.THRESH_TRUNC,cv2.THRESH_TOZERO,cv2.THRESH_TOZERO_INV etc
        contours,_ = cv2.findContours(threshold, cv2.RETR_LIST, cv2.CHAIN_APPROX_NONE)
        if len(contours)==0:
            self.visualise(frame,gblur)
            return None,None,False

        max_area, max_i = get_max_contour_area(contours)
        max_area_criterion = max_area > self.CONTOUR_AREA_THRESHOLD     
        if not max_area_criterion:
            self.visualise(frame,gblur)
            return None,None,False

        # cv2.drawContours(frame, contours, -1, (0, 0, 255), 6)
        max_contour=contours[max_i]
        draw_bounding_box(max_contour,frame)
        
        #TODO:maybe fuse the below into one value
        if (not self.USE_DEPTH_FROM_TELLO):
            z = estimate_z_based_on_contour(max_contour,self.z_estimation_polynomial)
            print("z raw:",z)
            z = np.array( [ self.filter.process(z) ] )
            print("z filtered:",z)
        else:
            z=np.array( [self.CAMERA_HEIGHT-self.actual_height] )
       
        contour_center = get_center_of_contour(max_contour)
        xy= self.estimate_xy_based_on_z(contour_center,z)
        
        tvec = [ xy[0], xy[1], z]
        rpy=[0,0,0]

        self.display_real_coords(frame,tvec)
        self.visualise(frame,gblur)
        tvec= [ [tvec] ]
        
        return tvec,rpy,True
    
    def kill(self):
        # When everything done, release the capture
        self.cap.release()
        cv2.destroyAllWindows()

    def update_actual_height(self,new_height):
        self.actual_height = new_height
        # print("self.actual_height:",self.actual_height)
    def update_rpy(self,rot):
        self.rot = rot

# pose_estimator=pose_extractor_CV_techniques()
# while (1):
#     pose_estimator.getPose()

if __name__=="__main__":
    p = calculate_pol_for_area_to_depth()
    areas=np.linspace(2000,30000,100)
    actual_sizes=np.polyval(p,areas)
    plt.plot(areas,actual_sizes)
    plt.show()

    parent_dir_path = dirname(dirname(abspath(__file__)))
    save_pol_for_area_to_depth(parent_dir_path+'/CV_techniques/pol_area_depth.yml',p)
    p=load_pol_for_area_to_depth(parent_dir_path+'/CV_techniques/pol_area_depth.yml')
    print(p)