from sympy.geometry.point import Point2D
from math import log, degrees, e
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from geometry_msgs.msg import Point

from .math_utils import Transformation, calculate2DAngleBetweenPoints, sqrt, sinh, cosh, tanhi
from .projection import get2DProjection


DEBUG = 0
PLOT = 0


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

    if 2*r/e < 1:
        if r < 3:
            Ai = sqrt(6*(r-1))
        else:
            Ai = log(2*r)+log(log(2*r))

        max_error = 0.001
        counter = 0
        while r-sinh(Ai)/Ai > max_error:
            num = sinh(Ai)-r*Ai
            denum = cosh(Ai)-r
            A_i = A_i-num/denum
            counter = counter + 1
        # print("Converged in {} loops".format(counter))
        A = Ai
    else:
        A_approx = 0.25 * (1+3*log(2*r))+sqrt(2*log(2*r/e))
        A = A_approx
        # print("A_approx:", A_approx)

    if A == 0:
        print("Opa A=0")
    a = dx/(2*A)
    b = xb-a*tanhi(dy/L)
    c = y1-a*cosh((x1-b)/a)

    x = x1
    ddx = 0.01*1
    length = (x2-x1)/ddx+1
    xy = np.zeros((int(length), 2), dtype=np.float64)
    counter = 0
    while x < x2:
        y = a*cosh((x-b)/a)+c
        xy[counter] = [x, y]
        x = x+ddx
        counter = counter+1

    if xy[-1][0] == 0 and xy[-1][1] == 0:
        print("mlkia:", length)
        xy = xy[:-1, :]  # delete last row
    else:
        pass

    return xy


def getCatenaryCurve3D(P1, P2, L):
    angle = calculate2DAngleBetweenPoints(P1, P2)
    rotation = [0, 0, degrees(-angle)]

    trans = Transformation(rotation, translation=P1)
    p2_1 = trans.transformPoint(P2)

    s, coords2D_x, coords2D_y = get2DProjection(list(P1), list(P2))

    start2D = [0, 0]
    ennd2D = [coords2D_x, coords2D_y]
    points2D = getCatenaryCurve2D(start2D, ennd2D, L)

    start3D = trans.inverseTransformPoint([start2D[0], 0, start2D[1]])
    end3D = trans.inverseTransformPoint([ennd2D[0], 0, ennd2D[1]])
    if DEBUG:
        print("coords2D:", coords2D_x, coords2D_y)
        print("start3D:", start3D)
        print("end3D:", end3D)

    # Points3D = map(
    #     lambda point: trans.inverseTransformPoint([point[0], 0, point[1]]), points2D)
    # Points3D = np.array(list(Points3D))

    Points3D = [trans.inverseTransformPoint([p[0], 0, p[1]]) for p in points2D]
    if PLOT:
        # plotting a scatter for example
        fig = plt.figure()
        ax = fig.add_subplot(111, projection="3d")
        Points3D = np.array(Points3D)
        ax.plot(Points3D[:, 0], Points3D[:, 1], Points3D[:, 2])

    return Points3D


if __name__ == "__main__":
    P1 = np.array([0, 0, 0])
    P2 = np.array([2, 0, 0])
    L = 3
    points = getCatenaryCurve3D(P1, P2, L)
    print(type(points))
    # print(points.shape)
    plt.show()
