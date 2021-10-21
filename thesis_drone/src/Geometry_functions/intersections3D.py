from . import intersections2D
# import intersections2D
import math

def intersection_with_cylinder_in_z(int_point,line_start,line_end,cyl_center,cyl_height):
    #checks if point of intersection with cylinder in 2D also intersects cylinder at in 3D
    x1 ,x2 = line_start[0] , line_end[0]
    y1 ,y2 = line_start[1] , line_end[1]
    z1 ,z2 = line_start[2] , line_end[2]
    
    x_int , y_int = int_point[0] , int_point[1]

    t = (x_int-x1) / (x2-x1)
    z_int = z1 + (z2-z1)*t

    cyl_center_z = cyl_center[2]
    intersects_in_z=( z_int>=cyl_center_z-cyl_height ) and ( z_int<=cyl_center_z+cyl_height ) #check if intersextion in z is between cylinder limits
    
    if intersects_in_z:
        return [x_int,y_int,z_int]
    else:
        None
    
def line_cylinder(line_start,line_end,cyl_center,r,cyl_height):

    p1,p2 = intersections2D.circle_line_segment_intersection(line_start,line_end,cyl_center,r)
    

    if p1 == None and p2==None:   #no intersection
        return None,None
    elif p1 != None and p2==None: # 1 intersection point
        x_int , y_int = p1[0] , p1[1]

        int_point = intersection_with_cylinder_in_z(p1,line_start,line_end)        
        return int_point , None
    else:                         # 2 intersection points
        x_int1 , y_int1 = p1[0] , p1[1]
        x_int2 , y_int2 = p2[0] , p2[1]

        int_point1 = intersection_with_cylinder_in_z(p1,line_start,line_end , cyl_center,cyl_height)
        int_point2 = intersection_with_cylinder_in_z(p2,line_start,line_end , cyl_center,cyl_height)

        return int_point1,int_point2


def line_sphere(line_start,line_end,sphere_center,r):
    """ Followed the process explained into:
        http://www.ambrsoft.com/TrigoCalc/Sphere/SpherLineIntersection_.htm
    """
    x1 , y1 ,z1 = line_start[0] , line_start[1] ,line_start[2]
    x2 , y2 ,z2 = line_end[0]   , line_end[1]   ,line_end[2]

    xc , yc ,zc = sphere_center[0] , sphere_center[1] ,sphere_center[2] 

    a = ( x2-x1 )**2 +( y2-y1 )**2 +( z2-z1 )**2
    b = -2 * ( (x2 - x1)*(xc - x1) + (y2 - y1)*(yc - y1) + (zc - z1)*(z2 - z1) )
    c = ( xc-x1 )**2 +( yc-y1 )**2 +( zc-z1 )**2 -r**2

    delta=math.sqrt( b**2 -4*a*c )
    
    if delta>0: # 2 intersection points
        t1 = ( -b + delta ) / (2*a)
        t2 = ( -b - delta ) / (2*a)

        x_int1 = x1 + (x2-x1)*t1
        x_int2 = x1 + (x2-x1)*t2

        y_int1 = y1 + (y2-y1)*t1 
        y_int2 = y1 + (y2-y1)*t2

        z_int1 = z1 + (z2-z1)*t1 
        z_int2 = z1 + (z2-z1)*t2

        return [x_int1,y_int1,z_int1] , [x_int2, y_int2,z_int2]

    elif delta == 0: # 1 intersection point
        t = -b / (2*a)

        x_int = x1 + (x2-x1)*t
        y_int = y1 + (y2-y1)*t 
        z_int = z1 + (z2-z1)*t 

        return [x_int,y_int,z_int] , None

    else:# no intersection point
        return None , None
    
if __name__=="__main__":
    #testing functions
    l_st = [0,0,0]
    l_end= [7.071067811865474, -7.071067811865477,1]
    sph_center=[4,-3,0]
    r=1
    p1,p2=line_cylinder(l_st,l_end,sph_center,r,4)
    print(p1)
    print(p2)
