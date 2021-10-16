from numpy.core.defchararray import translate
from geometry_msgs.msg import Vector3
from math import degrees, exp, log, sqrt, atan2
import math
import tf.transformations as transformations
import numpy as np


def cosh(z):
    return((exp(z)+exp(-z))/2)


def sinh(z):
    return((exp(z)-exp(-z))/2)


def tanhi(z):
    return((1/2)*log((1+z)/(1-z)))


def getTransformationMatrix(rotation, translation):
    """
    Returns the transformation matrix frame specified by rotation and translation .

    Parameters
    ----------
    rotation : array,Vector3
        Rotation angles on x,y,z axes.
    translation : array,Vector3
        Translation of the new frame.
    Returns
    -------
    output : ndarray
        Transformation Matrix.
    """
    origin, xaxis, yaxis, zaxis = (0, 0, 0), (1, 0, 0), (0, 1, 0), (0, 0, 1)
    I = transformations.identity_matrix()
    Rx = transformations.rotation_matrix(math.radians(rotation[0]), xaxis)
    Ry = transformations.rotation_matrix(math.radians(rotation[1]), yaxis)
    Rz = transformations.rotation_matrix(math.radians(rotation[2]), zaxis)
    R = transformations.concatenate_matrices(Rx, Ry, Rz)

    T = transformations.translation_matrix(-np.array(translation))
    M = transformations.concatenate_matrices(R, T)

    return M


def trig(theta):
    return math.cos(theta), math.sin(theta), math.tan(theta)


def calculate2DAngleBetweenPoints(p1, p2):
    x1, y1, z1 = p1
    x2, y2, z2 = p2

    dx = x2-x1
    dy = y2-y1

    angle = math.atan2(dy, dx)
    return angle


class Transformation():
    def __init__(self, rotation, translation) -> None:
        self.matrix = getTransformationMatrix(rotation, translation)
        self.inv_matrix = np.linalg.inv(self.matrix)

        # print(np.dot(self.inv_matrix, self.matrix))

    def transformPoint(self, p):
        if len(p) == 3:
            p = np.append(p, 1)

        p_m = np.dot(self.matrix, p)
        return p_m

    def inverseTransformPoint(self, p):
        if len(p) == 3:
            p = np.append(p, 1)

        p_m = np.dot(self.inv_matrix, p)
        return p_m


if __name__ == "__main__":
    P2 = np.array([2, 2, 0])
    translation = np.array([1, 1, 0])
    rotation = np.array([0, 0, 45])

    trans = Transformation(rotation, translation)
    p2_1 = trans.transformPoint(P2)
    p1_2 = trans.inverseTransformPoint(p2_1)

    print(p2_1)
    print(p1_2)
