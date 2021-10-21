
import numpy as np
import cv2
import glob
import argparse
from imutils.video import VideoStream
import time
import os
import sys

# getting the name of the directory
# where the this file is present.
current = os.path.dirname(os.path.realpath(__file__))
  
# Getting the parent directory name
# where the current directory is present.
parent = os.path.dirname(current)
  
# adding the parent directory to 
# the sys.path.
sys.path.append(parent)
  
# now we can import the module in the parent
# directory.
from  utilities import getVideoCap

USE_USB_CAMERA=True
SQUARE_SIZE=2.4 #cm
# termination criteria
criteria = (cv2.TERM_CRITERIA_EPS + cv2.TERM_CRITERIA_MAX_ITER, 30, 0.001)


def calibrate(dirpath, prefix, image_format, square_size, width=9, height=6):
    """ Apply camera calibration operation for images in the given directory path. """
    # prepare object points, like (0,0,0), (1,0,0), (2,0,0) ....,(8,6,0)
    objp = np.zeros((height*width, 3), np.float32)
    objp[:, :2] = np.mgrid[0:width, 0:height].T.reshape(-1, 2)

    objp = objp * square_size

    # Arrays to store object points and image points from all the images.
    objpoints = []  # 3d point in real world space
    imgpoints = []  # 2d points in image plane.

    if dirpath[-1:] == '/':
        dirpath = dirpath[:-1]

    images = glob.glob(dirpath+'/' + prefix + '*.' + image_format)
    print(images)
    for fname in images:
        img = cv2.imread(fname)
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        print(fname)
        # Find the chess board corners
        ret, corners = cv2.findChessboardCorners(gray, (width, height), None)

        # If found, add object points, image points (after refining them)
        if ret:
            objpoints.append(objp)

            corners2 = cv2.cornerSubPix(gray, corners, (11, 11), (-1, -1), criteria)
            imgpoints.append(corners2)

            # Draw and display the corners
            img = cv2.drawChessboardCorners(img, (width, height), corners2, ret)

    img = cv2.imread(images[0])
    sample = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    ret, mtx, dist, rvecs, tvecs = cv2.calibrateCamera(objpoints, imgpoints, sample.shape[::-1], None, None)

    return [ret, mtx, dist, rvecs, tvecs]

def save_coefficients(mtx, dist, path):
    """ Save the camera matrix and the distortion coefficients to given path/file. """
    cv_file = cv2.FileStorage(path, cv2.FILE_STORAGE_WRITE)
    cv_file.write("K", mtx)
    cv_file.write("D", dist)
    # note you *release* you don't close() a FileStorage object
    cv_file.release()

def load_coefficients(path):
    """ Loads camera matrix and distortion coefficients. """
    # FILE_STORAGE_READ
    cv_file = cv2.FileStorage(path, cv2.FILE_STORAGE_READ)

    # note we also have to specify the type to retrieve other wise we only get a
    # FileNode object back instead of a matrix
    camera_matrix = cv_file.getNode("K").mat()
    dist_matrix = cv_file.getNode("D").mat()

    cv_file.release()
    return camera_matrix, dist_matrix

def getCalibrationPhotos(numOfPhotos=25):
    if not os.path.isdir( 'calibration/calibrationPhotos' ) :
        os.mkdir( 'calibration/calibrationPhotos' )  # make sure the directory exists

    CAMERA_INDEX=0
    # For webcam input:
    cap = getVideoCap(usb=USE_USB_CAMERA)

    time.sleep(2.0)
    
    success, image = cap.read()
    count = 0
    while success and count<numOfPhotos:
        cv2.imshow("Calibration photo",image)
        #cv2.waitKey(0)#wait key to get next photo
        time.sleep(1)
        cv2.imwrite("calibration/calibrationPhotos/frame%d.jpg" % count, image)     # save frame as JPEG file      
        success,image = cap.read()
        print('Read a new frame: ', success)
        count += 1


if __name__=="__main__":
    save_new=input("Do you want to save new camera coefficients? [y/n]")
    if( save_new.lower() == "y" ):
        
        take_new_photos=input("Do you want to take new calibration photos? [y/n]")
        if( take_new_photos.lower() == "y" ):
            getCalibrationPhotos()
        
        ret, mtx, dist, rvecs, tvecs=calibrate('calibration/calibrationPhotos','frame','jpg',square_size=SQUARE_SIZE)
        save_coefficients(mtx,dist,"calibration/cameraCoeffs.yml")
    else:
        camera_matrix, dist_matrix=load_coefficients("calibration/cameraCoeffs.yml")
        print("camera_matrix:")
        print(camera_matrix)
        print("dist_matrix:")
        print(dist_matrix)
    pass