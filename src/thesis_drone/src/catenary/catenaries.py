from sympy.geometry.point import Point2D
from math_utils import Transformation, calculate2DAngleBetweenPoints, sqrt, sinh, cosh, tanhi
import math
import numpy as np
import matplotlib.pyplot as plt
from projection import get2DProjection
from mpl_toolkits.mplot3d import Axes3D

DEBUG = 1


def getCatenaryCurve2D(P1, P2, L):
    if DEBUG:
        print("Getting Catenary2D...")
        print("P1:", P1)
        print("P2:", P2)
        print("L :", L)

    x1, y1 = P1
    x2, y2 = P2

    dx = x2-x1
    dy = y2-y1

    xb = (x1+x2)/2
    yb = (x1+x2)/2

    r = sqrt(L**2-dy**2)/dx

    # rA=sinh(A)

    A = 0.01
    dA = 0.0001
    left = r*A
    right = sinh(A)
    # print(left,right)

    while left >= right:
        left = r*A
        right = sinh(A)
        A = A+dA

    A = A-dA

    a = dx/(2*A)
    b = xb-a*tanhi(dy/L)
    c = y1-a*cosh((x1-b)/a)

    xs, ys = [], []
    x = x1
    ddx = 0.001
    while x < x2:
        y = a*cosh((x-b)/a)+c
        xs.append(x)
        ys.append(y)
        x = x+ddx
    return xs, ys


def getCatenaryCurve3D(P1, P2, L):
    angle = calculate2DAngleBetweenPoints(P1, P2)
    rotation = [0, 0, math.degrees(-angle)]

    trans = Transformation(rotation, translation=P1)
    p2_1 = trans.transformPoint(P2)

    s, coords2D_x, coords2D_y = get2DProjection(list(P1), list(P2))

    start2D = [0, 0]
    ennd2D = [coords2D_x, coords2D_y]
    xs2D, ys2D = getCatenaryCurve2D(start2D, ennd2D, L)

    start3D = trans.inverseTransformPoint([start2D[0], 0, start2D[1]])
    end3D = trans.inverseTransformPoint([ennd2D[0], 0, ennd2D[1]])

    print("coords2D:", coords2D_x, coords2D_y)
    print("start3D:", start3D)
    print("end3D:", end3D)

    # plt.plot(xs2D, ys2D)

    Points3D = np.array([[None, None, None]]*len(xs2D))
    X, Y, Z = [], [], []
    for i in range(len(xs2D)):
        Point3D = trans.inverseTransformPoint([xs2D[i], 0, ys2D[i]])
        Points3D[i] = Point3D[:3]
        X.append(Points3D[i][0])
        Y.append(Points3D[i][1])
        Z.append(Points3D[i][2])

    print(Points3D[10])

    # plotting a scatter for example
    fig = plt.figure()
    ax = fig.add_subplot(111, projection="3d")
    ax.plot(X, Y, Z)
    return Points3D


if __name__ == "__main__":
    P1 = np.array([1, 1, 0])
    P2 = np.array([2, 2, 0])
    L = 4
    points = getCatenaryCurve3D(P1, P2, L)
    print(type(points))
    print(points.shape)
    plt.show()
