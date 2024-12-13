from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import random
import math

frame_w = 500
frame_h = 650

def points_draw(x, y):
    glPointSize(2)
    glBegin(GL_POINTS)
    glVertex2f(x, y)
    glEnd()

def dline(x1, y1, x2, y2):
    zone = locate(x1, y1, x2, y2)
    x1, y1, x2, y2 = all_zero_convert(zone, x1, y1, x2, y2)
    points = midpointAlgo(x1, y1, x2, y2)
    main_zone_convert(zone, points)

def midpointAlgo(x1, y1, x2, y2):
    points = []
    dx = x2 - x1
    dy = y2 - y1
    del_d = 2 * dy - dx
    North_E = 2 * (dy - dx)
    E = 2 * dy
    
    x = x1
    y = y1
    points.append([x, y])

    while x < x2:
        if del_d <= 0:
            del_d += E
        else:
            del_d += North_E
            y += 1
        x += 1
        points.append([x, y])
    return points

def locate(x1, y1, x2, y2):
    dx = x2 - x1
    dy = y2 - y1
    if dx > 0 and dy >= 0:
        if abs(dx) > abs(dy):
            return 0
        else:
            return 1
    elif dx <= 0 <= dy:
        if abs(dx) > abs(dy):
            return 3
        else:
            return 2
    elif dx < 0 and dy < 0:
        if abs(dx) > abs(dy):
            return 4
        else:
            return 5
    elif dx >= 0 > dy:
        if abs(dx) > abs(dy):
            return 7
        else:
            return 6

def all_zero_convert(zone, x1, y1, x2, y2):
    if zone == 1:
        x1, y1 = y1, x1
        x2, y2 = y2, x2
    elif zone == 2:
        x1, y1 = y1, -x1
        x2, y2 = y2, -x2
    elif zone == 3:
        x1, y1 = -x1, y1
        x2, y2 = -x2, y2
    elif zone == 4:
        x1, y1 = -x1, -y1
        x2, y2 = -x2, -y2
    elif zone == 5:
        x1, y1 = -y1, -x1
        x2, y2 = -y2, -x2
    elif zone == 6:
        x1, y1 = -y1, x1
        x2, y2 = -y2, x2
    elif zone == 7:
        x1, y1 = x1, -y1
        x2, y2 = x2, -y2
    return x1, y1, x2, y2

def main_zone_convert(zone, points):
    if zone == 0:
        for x, y in points:
            points_draw(x, y)
    elif zone == 1:
        for x, y in points:
            points_draw(y, x)
    elif zone == 2:
        for x, y in points:
            points_draw(-y, x)
    elif zone == 3:
        for x, y in points:
            points_draw(-x, y)
    elif zone == 4:
        for x, y in points:
            points_draw(-x, -y)
    elif zone == 5:
        for x, y in points:
            points_draw(-y, -x)
    elif zone == 6:
        for x, y in points:
            points_draw(y, -x)
    elif zone == 7:
        for x, y in points:
            points_draw(x, -y)

# # Spaceship drawing with scaling
def draw_spaceship(x, y, scale=0.3):  # Add scale parameter
    # Top pointy triangle (nose of spaceship)
    dline(x, y+50*scale, x-20*scale, y+20*scale)  # left side of triangle
    dline(x, y+50*scale, x+20*scale, y+20*scale)  # right side of triangle
    dline(x-20*scale, y+20*scale, x+20*scale, y+20*scale)  # bottom of triangle
    
    # Body of spaceship (rectangle)
    dline(x-20*scale, y+20*scale, x-30*scale, y-20*scale)  # left side of body
    dline(x+20*scale, y+20*scale, x+30*scale, y-20*scale)  # right side of body
    dline(x-30*scale, y-20*scale, x+30*scale, y-20*scale)  # bottom of body

    # Wings (diagonal lines on both sides)
    dline(x-30*scale, y-20*scale, x-50*scale, y-50*scale)  # left wing
    dline(x+30*scale, y-20*scale, x+50*scale, y-50*scale)  # right wing

    # Circular window on the spaceship body
    draw_circle(x, y, 10*scale)  # window position at (x, y) with scaled radius
    
    # Fire at the bottom (3 lines)
    dline(x-20*scale, y-20*scale, x-10*scale, y-50*scale)  # left fire
    dline(x-22*scale, y-22*scale, x-12*scale, y-52*scale)  # left fire
    
    dline(x+20*scale, y-20*scale, x+10*scale, y-50*scale)  # right fire
    dline(x+22*scale, y-22*scale, x+12*scale, y-52*scale)  # right fire
    
    dline(x, y-20*scale, x, y-50*scale)        # middle fire
    dline(x+2*scale, y-22*scale, x, y-52*scale)        # middle fire


def draw_circle(x, y, radius):
    glBegin(GL_POLYGON)
    for i in range(360):
        angle = math.radians(i)
        dx = radius * math.cos(angle)
        dy = radius * math.sin(angle)
        glVertex2f(x + dx, y + dy)
    glEnd()

def display():
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glClearColor(0, 0, 0, 0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
    gluLookAt(0, 0, 200, 0, 0, 0, 0, 1, 0)
    glMatrixMode(GL_MODELVIEW)

    # Draw spaceship at position (0, 0)
    draw_spaceship(0, 0)

    glutSwapBuffers()

def init():
    glClearColor(0, 0, 0, 0)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    gluPerspective(103, 1, 1, 1000.0)

glutInit()
glutInitWindowSize(frame_w, frame_h)
glutInitWindowPosition(500, 0)
glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGB)
frame = glutCreateWindow(b"Spaceship Drawing")
init()
glutDisplayFunc(display)
glutMainLoop()
