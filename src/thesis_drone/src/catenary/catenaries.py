from math_utils import Transformation, sqrt, sinh, cosh, tanhi
import math
import numpy as np
import matplotlib.pyplot as plt

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
    x1, y1, z1 = P1
    x2, y2, z2 = P2

    dx = x2-x1
    dy = y2-y1

    angle = math.atan2(dy, dx)

    print("angle in degrees:", math.degrees(angle))

    rotation = [0, 0, math.degrees(angle)]
    trans = Transformation(rotation, translation=P1)

    p2_1 = trans.transformPoint(P2)

    start = [0, 0, 0]
    xs2D, ys2D = getCatenaryCurve2D(start[:2], p2_1[:2], L)
    # print(xs2D)
    # print(ys2D)

    plt.plot(xs2D, ys2D)


if __name__ == "__main__":
    # xs, ys = getCatenaryCurve2D([0, 0], [0.5, 1], 2)
    # plt.plot(xs, ys)
    P1 = np.array([1, 1, 0])
    P2 = np.array([2, 2, 0])
    L = 2
    getCatenaryCurve3D(P1, P2, L)
    plt.show()
