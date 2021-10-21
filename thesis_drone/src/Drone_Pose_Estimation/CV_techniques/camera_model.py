import cv2
import numpy as np
import os,sys
def add_parent_folder_to_path():
    print ("current file:",cv2.__file__)
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

from calibration import calibration

def Project(points, intrinsic, distortion):
  result = []
  rvec = tvec = np.array([0.0, 0.0, 0.0])
  if len(points) > 0:
    result, _ = cv2.projectPoints(points, rvec, tvec,intrinsic, distortion)
  return np.squeeze(result, axis=1)

def Unproject(points, Z, intrinsic, distortion):
    f_x = intrinsic[0, 0]
    f_y = intrinsic[1, 1]
    c_x = intrinsic[0, 2]
    c_y = intrinsic[1, 2]
    # This was an error before
    # c_x = intrinsic[0, 3]
    # c_y = intrinsic[1, 3] 
    # Step 1. Undistort.
    points_undistorted = np.array([])
    if len(points) > 0:
        points_undistorted = cv2.undistortPoints(np.expand_dims(points, axis=1), intrinsic, distortion, P=intrinsic)
        # points_undistorted = cv2.undistortPoints(np.float32([[points]]), intrinsic, distortion, P=intrinsic)

    points_undistorted = np.squeeze(points_undistorted, axis=1) 
    # Step 2. Reproject.
    result = []
    for idx in range(points_undistorted.shape[0]):
        z = Z[0] if len(Z) == 1 else Z[idx]
        x = (points_undistorted[idx, 0] - c_x) / f_x * z
        y = (points_undistorted[idx, 1] - c_y) / f_y * z
        result.append([x, y, z])
    return result

if __name__=="__main__":
    f_x = 1000.
    f_y = 1000.
    c_x = 1000.
    c_y = 1000.

    intrinsic = np.array([
      [f_x, 0.0, c_x],
      [0.0, f_y, c_y],
      [0.0, 0.0, 1.0]
    ])

    distortion = np.array([0.0, 0.0, 0.0, 0.0])  # This works!
    distortion = np.array([-0.32, 1.24, 0.0013, 0.0013])  # This doesn't!

    point_single = np.array([[-10.0, 2.0, 12.0],])

    point_single_projected = Project(point_single, intrinsic, distortion)

    Z = np.array([point[2] for point in point_single])
    point_single_unprojected = Unproject(point_single_projected,Z,intrinsic, distortion)

    print ("Expected point:", point_single[0])
    print ("Computed point:", point_single_unprojected[0])
    