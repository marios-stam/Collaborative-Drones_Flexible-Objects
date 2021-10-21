from numpy.lib.function_base import extract
from .utilities import getVideoCap
from .tracking import pose_estimation_simple
from .calibration import calibration
import cv2
import os

class pose_extractor:
    def __init__(self,USB_cam=1):
        self.cap = getVideoCap(usb=USB_cam)
        params=calibration.load_coefficients("catkin_ws/src/thesis_drone/src/Drone_Pose_Estimation/calibration/cameraCoeffs.yml")
        print(params)
        self.matrix_coefficients,self.distortion_coefficients=params[0],params[1]
        
    def getPose(self):
        ret, frame = self.cap.read()

        matrix_coefficients, distortion_coefficients=self.matrix_coefficients,self.distortion_coefficients
        frame,tvec,rpy= pose_estimation_simple(frame, matrix_coefficients, distortion_coefficients)
        frame=cv2.flip(frame, 1) #flip frame to make it easier for user to test it live

        
        found_pose= len(tvec)>0
        
        if found_pose:
            self.display_real_coords(frame,tvec)

        cv2.imshow('frame', frame)
        
        key = cv2.waitKey(3) & 0xFF
        if key == ord('q'):  # Quit
            self.kill()
            return None,None

        return tvec,rpy,found_pose
    
    def kill(self):
        # When everything done, release the capture
        self.cap.release()
        cv2.destroyAllWindows()
    
    def display_real_coords(self,frame,tvec):
        font = cv2.FONT_HERSHEY_SIMPLEX
        cv2.putText(frame, "x:%.1f"%(tvec[0][0][0]),(40,30) ,font, 1, (0, 0, 255),2, cv2.FILLED)
        cv2.putText(frame, "y:%.1f"%(tvec[0][0][1]),(40,70) ,font, 1, (0, 0, 255),2, cv2.FILLED)
        cv2.putText(frame, "z:%.1f"%(tvec[0][0][2]),(40,110) ,font, 1, (0, 0, 255),2, cv2.FILLED)


if __name__=="__main__":
    pose_estimator=pose_extractor(USB_cam=0)

    while True:
        pose_estimator.getPose()