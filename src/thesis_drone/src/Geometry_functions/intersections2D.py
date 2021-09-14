import math
import numpy as np



class Vector2D:
    """A two-dimensional vector with Cartesian coordinates."""

    def __init__(self, x, y):
        self.x, self.y = x, y

    def __str__(self):
        """Human-readable string representation of the vector."""
        return '{:g}i + {:g}j'.format(self.x, self.y)

    def __repr__(self):
        """Unambiguous string representation of the vector."""
        return repr((self.x, self.y))

    def dot(self, other):
        """The scalar (dot) product of self and other. Both must be vectors."""

        if not isinstance(other, Vector2D):
            raise TypeError('Can only take dot product of two Vector2D objects')
        return self.x * other.x + self.y * other.y
    # Alias the __matmul__ method to dot so we can use a @ b as well as a.dot(b).
    __matmul__ = dot

    def __sub__(self, other):
        """Vector subtraction."""
        return Vector2D(self.x - other.x, self.y - other.y)

    def __add__(self, other):
        """Vector addition."""
        return Vector2D(self.x + other.x, self.y + other.y)

    def __mul__(self, scalar):
        """Multiplication of a vector by a scalar."""

        if isinstance(scalar, int) or isinstance(scalar, float):
            return Vector2D(self.x*scalar, self.y*scalar)
        raise NotImplementedError('Can only multiply Vector2D by a scalar')

    def __rmul__(self, scalar):
        """Reflected multiplication so vector * scalar also works."""
        return self.__mul__(scalar)

    def __neg__(self):
        """Negation of the vector (invert through origin.)"""
        return Vector2D(-self.x, -self.y)

    def __truediv__(self, scalar):
        """True division of the vector by a scalar."""
        return Vector2D(self.x / scalar, self.y / scalar)

    def __mod__(self, scalar):
        """One way to implement modulus operation: for each component."""
        return Vector2D(self.x % scalar, self.y % scalar)

    def __abs__(self):
        """Absolute value (magnitude) of the vector."""
        return math.sqrt(self.x**2 + self.y**2)

    def distance_to(self, other):
        """The distance between vectors self and other."""
        return abs(self - other)

    def to_polar(self):
        """Return the vector's components in polar coordinates."""
        return self.__abs__(), math.atan2(self.y, self.x)
def sign(x):
    if x<0:
        return -1
    else:
        return 0

def line_circle(line_start,line_end,circle_center,r):
    #calculation according to https://mathworld.wolfram.com/Circle-LineIntersection.html
    print("line_start,line_end,circle_center,r",line_start,line_end,circle_center,r)
    x1,y1 = line_start[0] ,line_start[1]
    x2,y2 = line_end[0] ,line_end[1]

    xc , yc = circle_center[0] ,circle_center[1]

    #translate it to origin (must test if it is working fine)
    x1,y1 = x1 - xc , y1 - yc
    x2,y2 = x2 - xc , y2 - yc

    print("x1,y1",x1,y1)
    print("x2,y2",x2,y2)

    dx = x2-x1
    dy = y2-y1
    dr = math.sqrt( dx**2 + dy**2 )
    
    Det = x1 * y2 - x2 * y1

    delta = (r**2) * (dr**2) - (Det**2)
    print("dx",dx)
    print("dy",dy)
    print("dr",dr)
    print("Det",Det)
    print("delta",delta)


    if delta>0: # 2 intersection points
        x_int1 =(  Det*dy + sign(dy)*dx*math.sqrt(delta) ) / (dr**2)
        x_int2 =(  Det*dy - sign(dy)*dx*math.sqrt(delta) ) / (dr**2)

        y_int1 =( -Det*dx + abs(dy)*math.sqrt(delta) )    / (dr**2)
        y_int2 =( -Det*dx - abs(dy)*math.sqrt(delta) )    / (dr**2)

        return [x_int1+xc,y_int1+yc] , [x_int2+xc, y_int2+yc]
    elif delta == 0: # 1 intersection point
        x_int1 =(  Det*dy  ) / (dr**2)
        y_int1 =( -Det*dx  ) / (dr**2)
        return [x_int1+xc,y_int1+yc] , None

    else:# no intersection point
        return None , None

def circle_line_segment_intersection(pt1, pt2, circle_center, circle_radius, full_line=False, tangent_tol=1e-9):
    """ Find the points at which a circle intersects a line-segment.  This can happen at 0, 1, or 2 points.

    :param circle_center: The (x, y) location of the circle center
    :param circle_radius: The radius of the circle
    :param pt1: The (x, y) location of the first point of the segment
    :param pt2: The (x, y) location of the second point of the segment
    :param full_line: True to find intersections along full line - not just in the segment.  False will just return intersections within the segment.
    :param tangent_tol: Numerical tolerance at which we decide the intersections are close enough to consider it a tangent
    :return Sequence[Tuple[float, float]]: A list of length 0, 1, or 2, where each element is a point at which the circle intercepts a line segment.

    Note: We follow: http://mathworld.wolfram.com/Circle-LineIntersection.html
    """

    (p1x, p1y), (p2x, p2y), (cx, cy) = pt1[:2], pt2[:2], circle_center[:2]
    (x1, y1), (x2, y2) = (p1x - cx, p1y - cy), (p2x - cx, p2y - cy)
    dx, dy = (x2 - x1), (y2 - y1)
    dr = (dx ** 2 + dy ** 2)**.5
    big_d = x1 * y2 - x2 * y1
    discriminant = circle_radius ** 2 * dr ** 2 - big_d ** 2

    if discriminant < 0:  # No intersection between circle and line
        return None,None
    else:  # There may be 0, 1, or 2 intersections with the segment
        intersections = [
            (cx + (big_d * dy + sign * (-1 if dy < 0 else 1) * dx * discriminant**.5) / dr ** 2,
             cy + (-big_d * dx + sign * abs(dy) * discriminant**.5) / dr ** 2)
            for sign in ((1, -1) if dy < 0 else (-1, 1))]  # This makes sure the order along the segment is correct
        if not full_line:  # If only considering the segment, filter out intersections that do not fall within the segment
            fraction_along_segment = [(xi - p1x) / dx if abs(dx) > abs(dy) else (yi - p1y) / dy for xi, yi in intersections]
            intersections = [pt for pt, frac in zip(intersections, fraction_along_segment) if 0 <= frac <= 1]
            
            int_points=len(intersections)
            None_count=2-int_points
            for i in range(None_count):
                    intersections.append(None)
            return intersections
        if len(intersections) == 2 and abs(discriminant) <= tangent_tol:  # If line is tangent to circle, return just one point (as both intersections have same location)
            return intersections[0],None
        else:
            return intersections
if __name__=="__main__":
    l_st = [0,0]
    l_end= [10, 0]
    sph_center=[2,0]
    r=1
    x=circle_line_segment_intersection(sph_center,r,l_st,l_end)
    print(x)