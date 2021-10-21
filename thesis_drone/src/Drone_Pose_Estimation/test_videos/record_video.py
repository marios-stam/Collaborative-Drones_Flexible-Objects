import numpy as np
import cv2
import os,sys
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

file_name='tello_flight2'

cap = getVideoCap(usb=1)

# Define the codec and create VideoWriter object
# fourcc = cv2.CV_FOURCC(*'MP4V')
fourcc =cv2.VideoWriter_fourcc('m', 'p', '4', 'v')
out = cv2.VideoWriter(r"src/thesis_drone/src/Drone_Pose_Estimation/test_videos/%s.mp4"%(file_name),fourcc, 20.0, (640,480))

while(cap.isOpened()):
    ret, frame = cap.read()
    if ret==True:
        frame = cv2.flip(frame,0)

        # write the flipped frame
        out.write(frame)

        cv2.imshow('frame',frame)
        #press q to STOP RECORDING 
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    else:
        break

# Release everything if job is finished
cap.release()
out.release()
cv2.destroyAllWindows()