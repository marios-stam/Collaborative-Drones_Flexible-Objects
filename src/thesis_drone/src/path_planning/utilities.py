import math

def point_collides_with_cylinder(pos:list) -> bool:
    cyl_r=
    cyl_height=
    cyl_center=

    d=distance2D(pos,cyl_center)
    height_check = pos[2]<= cyl_center[2]-cyl_height/2 and pos[2]>= cyl_center[2]+cyl_height/2

    return ( d<cyl_r and height_check )

def distance2D(p1,p2):
    d2=(p1[0]-p2[0])**2 + (p1[1]-p2[1])**2  
    return math.sqrt( d2 )


