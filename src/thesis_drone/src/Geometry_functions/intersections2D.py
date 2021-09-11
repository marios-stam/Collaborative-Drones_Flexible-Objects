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

    x1,y1 = line_start[0] ,line_start[1]
    x2,y2 = line_end[0] ,line_end[1]

    xc = circle_center[0]
    yc = circle_center[1]

    #translate it to origin (must test if it is working fine)
    x1,y1 = x1 - xc , y1 -yc
    x2,y2 = x2 - xc , y2-yc

    dx = x1-x2
    dy = y1-y2
    dr = math.sqrt( dx**2 + dy**2 )
    
    A=[ [x1 , x2],
        [y1 , y2] 
    ]

    D=np.linalg.det(A)

    delta = (r**2) * (dr**2) - (D**2)
    
    if delta>0: # 2 intersection points
        x_int1 =(  D*dy + sign(dy)*dx*math.sqrt(delta) ) / (dr**2)
        x_int2 =(  D*dy - sign(dy)*dx*math.sqrt(delta) ) / (dr**2)

        y_int1 =( -D*dx + sign(dy)*math.sqrt(delta) )    / (dr**2)
        y_int2 =( -D*dx - sign(dy)*math.sqrt(delta) )    / (dr**2)

        return [x_int1,y_int1] , [x_int2, y_int2]
    elif delta == 0: # 1 intersection point
        x_int1 =(  D*dy  ) / (dr**2)
        y_int1 =( -D*dx  ) / (dr**2)
        return [x_int1,y_int1] , None

    else:# no intersection point
        return None , None