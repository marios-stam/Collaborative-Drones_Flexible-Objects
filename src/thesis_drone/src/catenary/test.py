from numpy.core.defchararray import translate
from geometry_msgs.msg import Vector3
from math import degrees, exp,log,sqrt,atan2
import math
import matplotlib.pyplot as plt 
import tf.transformations as transformations 
import numpy as np

def cosh(z):
  return((exp(z)+exp(-z))/2)

def sinh(z):
  return((exp(z)-exp(-z))/2)

def tanhi(z):
  return((1/2)*log((1+z)/(1-z)))

def getCatenaryCurve2D( P1, P2, L):
    dx=P2.x-P1.x
    xb=(P2.x+P1.x)/2

    dy=P2.y-P1.y
    yb=(P2.y+P1.y)/2

    r=sqrt(L**2-dy**2)/dx

    #rA=sinh(A)

    A=0.01
    dA=0.0001
    left=r*A
    right=sinh(A)
    #print(left,right)

    while left>=right:
      left=r*A
      right=sinh(A)
      A=A+dA

    A=A-dA

    a=dx/(2*A)
    b=xb-a*tanhi(dy/L)
    c=P1.y-a*cosh((P1.x-b)/a)

    xs , ys = [] , []
    x=P1.x
    ddx=0.001
    while x<P2.x:
        y=a*cosh((x-b)/a)+c
        xs.append(x)
        ys.append(y)
        x=x+ddx
    return xs,ys

def transfromPoint(P, rotation,translation):
    """
    Returns the coordinates of the point P on the frame specified by rotation and translation .

    Parameters
    ----------
    P : Vector3
        Point on global frame.
    rotation : array,Vector3
        Rotation angles on x,y,z axes.
    translation : array,Vector3
        Translation of the new frame.
    Returns
    -------
    output : ndarray,Vector3
        Coordinates of the desired point.
    """
    origin, xaxis, yaxis, zaxis = (0, 0, 0), (1, 0, 0), (0, 1, 0), (0, 0, 1)
    I  = transformations.identity_matrix()
    Rx = transformations.rotation_matrix(math.radians(rotation[0]), xaxis)
    Ry = transformations.rotation_matrix(math.radians(rotation[1]), yaxis)
    Rz = transformations.rotation_matrix(math.radians(rotation[2]), zaxis)
    R  = transformations.concatenate_matrices(Rx, Ry, Rz)

    T  = transformations.translation_matrix(-translation)    
    M  = transformations.concatenate_matrices(R,T)
    
    P = np.append(P,1)

    P_M = np.dot(M,P) 

    print("P2_M:",P_M)

    return P_M

def trig (theta):
    return math.cos(theta),math.sin(theta),math.tan(theta)

if __name__ == "__main__":
    P2=np.array( [2 ,2 ,0 ] )
    translation = np.array( [1 ,1 ,0   ] )
    rotation    = np.array( [0 ,90 ,0 ] )


    L=0.65
    
    # xs, ys = getCatenaryCurve2D(P1, P2, L)
    transfromPoint( P2, rotation, translation)

    # plt.plot(xs,ys)
    # plt.show()