import cv2
from imutils.video import VideoStream

def getVideoCap(usb=True):
    int_camera_index=0
    usb_camera_index=2
    if(usb):
        cap = cv2.VideoCapture(usb_camera_index)
        cap.set(cv2.CAP_PROP_FPS, 30)
        # W, H = 1920, 1080
        # cap.set(cv2.CAP_PROP_FRAME_WIDTH, W)
        # cap.set(cv2.CAP_PROP_FRAME_HEIGHT, H)
        # cap.set(cv2.CAP_PROP_FOURCC, cv2.VideoWriter_fourcc('M', 'J', 'P', 'G'))
    else:
        cap = cv2.VideoCapture(int_camera_index)
    
    return cap

if __name__=="__main__":
    cap=getVideoCap(usb=True)
    success, image = cap.read()
    cv2.imshow('test',image)
    cv2.waitKey(0)