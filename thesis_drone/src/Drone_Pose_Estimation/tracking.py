import numpy as np
import cv2
import cv2.aruco as aruco
from Drone_Pose_Estimation.calibration import calibration
import glob
from matplotlib import pyplot as plt

from utilities import getVideoCap
#from graphs import setup_xyz_graph,update_xyz_graph
from graphs import xyz_graph
from math_operations import rotationMatrixToEulerAngles

MARKER_LENGTH=7.9

LIVE_VIDEO_MODE=1

USB_CAMERA=0

SIMPLE_POSE_ALGORITHM=True

XYZ_GRAPH=0

def track_live_video(matrix_coefficients, distortion_coefficients):
    cap = getVideoCap(usb=USB_CAMERA)
    xyz_gr=xyz_graph()
    
    while True:
        ret, frame = cap.read()
        # operations on the frame come here
        if SIMPLE_POSE_ALGORITHM:
            frame,tvec,rpy = pose_estimation_simple(frame, matrix_coefficients, distortion_coefficients)
        else:
            frame,tvec= pose_estimation(frame, matrix_coefficients, distortion_coefficients)
        
        frame=cv2.flip(frame, 1) #flip frame to make it easier for user to test it live
        
        if len(tvec)>0:
            #text="%.1f,%.1f,%.1f"%( tvec[0][0][0],tvec[0][0][1],tvec[0][0][2] )
            text="%.1f,%.1f,%.1f"%( rpy[0],rpy[1],rpy[2] )
            frame = writeTextToFrame(frame, text)
            if XYZ_GRAPH:
                xyz_gr.update(tvec)

        cv2.imshow('frame', frame)
        key = cv2.waitKey(3) & 0xFF
        if key == ord('q'):  # Quit
            break
                
    # When everything done, release the capture
    cap.release()
    cv2.destroyAllWindows()

def writeTextToFrame(frame, text):
    # font 
    font = cv2.FONT_HERSHEY_SIMPLEX 
    # org 
    org = (50, 50) 
    # fontScale 
    fontScale = 1
    # Blue color in BGR 
    color = (0, 0, 255) 
    # Line thickness of 2 px 
    thickness = 2
    # Using cv2.putText() method 
    frame = cv2.putText(frame, text , org, font,fontScale, color, thickness, cv2.LINE_AA) 
    return frame

def track_photos(matrix_coefficients, distortion_coefficients,dirpath="test_photos",image_format="jpg"):   
    if dirpath[-1:] == '/':
        dirpath = dirpath[:-1]

    images = glob.glob(dirpath+'/' + '*.' + image_format)
    
    frames=[]
    for fname in images:
        frame = cv2.imread(fname)
        # operations on the frame come here
        if SIMPLE_POSE_ALGORITHM:
            frame,tvec = pose_estimation_simple(frame, matrix_coefficients, distortion_coefficients)
        else:
            frame,tvec = pose_estimation(frame, matrix_coefficients, distortion_coefficients)
        
        frame=cv2.flip(frame, 1) #flip frame to make it easier for user to test it live
        
        if len(tvec)>0:
            text="%.1f,%.1f,%.1f"%( tvec[0][0][0],tvec[0][0][1],tvec[0][0][2] )
            frame = writeTextToFrame(frame, text)

        frames.append(frame)

    plt.figure()
    for i,f in enumerate(frames):
        plt.subplot(2,3,i+1)
        plt.imshow( cv2.cvtColor(f, cv2.COLOR_BGR2RGB) )

    plt.show()

def pose_estimation(frame, matrix_coefficients, distortion_coefficients):
    # operations on the frame come here
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)  # Change grayscale
    # aruco_dict = aruco.Dictionary_get(aruco.DICT_5X5_250)  # Use 5x5 dictionary to find markers
    aruco_dict = aruco.Dictionary_get(aruco.DICT_4X4_50)  # Use 5x5 dictionary to find markers
    parameters = aruco.DetectorParameters_create()  # Marker detection parameters
    # lists of ids and the corners beloning to each id

    corners, ids, rejected_img_points = aruco.detectMarkers(gray, aruco_dict,
                                                            parameters=parameters,
                                                            cameraMatrix=matrix_coefficients,
                                                            distCoeff=distortion_coefficients)

    #if no calibration has been done
    #corners, ids, rejected_img_points = aruco.detectMarkers(gray, aruco_dict,
    #                                                        parameters=parameters)

    if np.all(ids is not None):  # If there are markers found by detector
        for i in range(0, len(ids)):  # Iterate in markers
            # Estimate pose of each marker and return the values rvec and tvec---different from camera coefficients

            #rvec, tvec, _ = aruco.estimatePoseSingleMarkers(corners[i], 0.02, matrix_coefficients,distortion_coefficients)
            rvec, tvec, _ = cv2.aruco.estimatePoseSingleMarkers(corners, MARKER_LENGTH, matrix_coefficients, distortion_coefficients)

            #(rvec - tvec).any()  # get rid of that nasty numpy value array error
            aruco.drawDetectedMarkers(frame, corners)  # Draw A square around the markers
            aruco.drawAxis(frame, matrix_coefficients, distortion_coefficients, rvec, tvec, 0.01)  # Draw Axis
            # Display the resulting frame
            # cv2.imshow('frame', frame)
            # Wait 3 milisecoonds for an interaction. Check the key and do the corresponding job.
            R = cv2.Rodrigues(rvec)[0]  # 回転ベクトル -> 回転行列
            R_T = R.T
            T = tvec[0].T

            xyz = np.dot(R_T,  T).squeeze()
            rpy = np.deg2rad(cv2.RQDecomp3x3(R_T)[0])

            # font 
            frame = writeTextToFrame(frame, "%.1f,%.1f,%.1f"%( tvec[0][0][0],tvec[0][0][1],tvec[0][0][2])) 
            frame = cv2.putText(frame, "%.2f,%.2f,%.2f"%( rpy[0],rpy[1],rpy[2] ) , (50,120), font,fontScale, color, thickness, cv2.LINE_AA) 
    else:
        pass
        #print("mlkia")
    return frame

def pose_estimation_simple(frame, matrix_coefficients, distortion_coefficients):
    # operations on the frame come here
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)  # Change grayscale
    # aruco_dict = aruco.Dictionary_get(aruco.DICT_5X5_250)  # Use 5x5 dictionary to find markers
    aruco_dict = aruco.Dictionary_get(aruco.DICT_4X4_50)  # Use 5x5 dictionary to find markers
    parameters = aruco.DetectorParameters_create()  # Marker detection parameters
    # lists of ids and the corners beloning to each id

    corners, ids, rejected_img_points = aruco.detectMarkers(gray, aruco_dict,
                                                            parameters=parameters,
                                                            cameraMatrix=matrix_coefficients,
                                                            distCoeff=distortion_coefficients)
    
    tvec,rpy=[],[]
    if np.all(ids is not None):  # If there are markers found by detector
        for i in range(0, len(ids)):  # Iterate in markers
            # Estimate pose of each marker and return the values rvec and tvec---different from camera coefficients
            rvec, tvec, _ = cv2.aruco.estimatePoseSingleMarkers(corners[i], MARKER_LENGTH, matrix_coefficients, distortion_coefficients)

            #(rvec - tvec).any()  # get rid of that nasty numpy value array error
            aruco.drawDetectedMarkers(frame, corners)  # Draw A square around the markers

            R=cv2.Rodrigues(rvec)[0]
            rpy=rotationMatrixToEulerAngles(R)

    return frame,tvec,rpy

if __name__=="__main__":
    camera_matrix, dist_matrix=calibration.load_coefficients("calibration/cameraCoeffs.yml")
    if(LIVE_VIDEO_MODE):
        track_live_video(camera_matrix,dist_matrix)
    else:
        track_photos(camera_matrix,dist_matrix)