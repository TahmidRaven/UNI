import random
from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *

width, height = 500, 500

pointlst = []
speed = 0.2
pause = False


class Point:
    def __init__(self, x, y, x_dir, y_dir, clr):
        self.x = x
        self.y = y
        self.xdirection = x_dir
        self.ydirection = y_dir
        self.clr = clr


def draw_point():
    global pointlst
    glPointSize(20)
    glBegin(GL_POINTS)
    for i in pointlst:
        glColor3f(i.clr[0], i.clr[1], i.clr[2])
        glVertex2f(i.x, i.y)
    glEnd()


def convert_coordinate(x, y):
    global width, height
    a = x - (width / 2)
    b = (height / 2) - y
    return a, b


def mouseListener(button, state, x, y):
    global pointlst, pause
    points = [(-1, 1), (-1, -1), (1, 1), (1, -1)]
    
    if button == GLUT_RIGHT_BUTTON and state == GLUT_DOWN:
        if not pause:
            x, y = convert_coordinate(x, y)
            x_dir, y_dir = random.choice(points)
            clr = [random.random(), random.random(), random.random()]
            new_point = Point(x, y, x_dir, y_dir, clr)
            pointlst.append(new_point)
            print(f"New point: {x, y, x_dir, y_dir}")
        else:
            print("Paused")

    if button == GLUT_LEFT_BUTTON and state == GLUT_DOWN:
        pause = not pause
        if pause:
            print("Paused")
        else:
            print("Unpaused")

    glutPostRedisplay()


def specialKeyListener(key, x, y):
    global speed, pause

    if key == GLUT_KEY_UP:
        if not pause:
            speed *= 2.5
            print("Speed Increased")
        else:
            print("Paused")

    if key == GLUT_KEY_DOWN:
        if not pause:
            speed /= 2.5
            print("Speed Decreased")
        else:
            print("Paused")

    glutPostRedisplay()


def keyboardListener(key, x, y):
    global pause

    if key == b' ':
        pause = not pause
        if pause:
            print("Paused")
        else:
            print("Unpaused")

    glutPostRedisplay()


def iterate():
    glViewport(0, 0, 500, 500)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(-500, 500, -500, 500, 0.0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()


def showScreen():
    glClearColor(0, 0, 0, 0)
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    iterate()
    draw_point()
    glutSwapBuffers()


def animate():
    global pointlst, speed, pause

    if not pause:
        for i in pointlst:
            i.x += i.xdirection * speed
            i.y += i.ydirection * speed

            if i.x >= 500 or i.x <= -500:
                i.xdirection *= -1

            if i.y >= 500 or i.y <= -500:
                i.ydirection *= -1

    glutPostRedisplay()


glutInit()
glutInitDisplayMode(GLUT_RGBA)
glutInitWindowSize(500, 500)
glutInitWindowPosition(0, 0)
wind = glutCreateWindow(b"TASK")
glutDisplayFunc(showScreen)
glutIdleFunc(animate)
glutMouseFunc(mouseListener)
glutSpecialFunc(specialKeyListener)
glutKeyboardFunc(keyboardListener)
glutMainLoop()