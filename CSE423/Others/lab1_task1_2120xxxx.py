from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import random

angle = 0
bg_clr = [0, 0, 0]
rain = []

class Raindrop:
    def __init__(self, x, y):
        self.x = x  # x-coordinate of raindrop
        self.y = y  # y-coordinate of raindrop
        self.velrain = random.random() * 4  # random velocity

def draw_rain(drawpt):
    glLineWidth(2)
    glBegin(GL_LINES)
    glColor3f(0, 0, 1)
    glVertex2f(drawpt.x, drawpt.y)
    glVertex2f(drawpt.x, drawpt.y +10)  # Adjust length of raindrop line as needed
    glEnd()

def raindrop(drawpt):
    drawpt.y -= drawpt.velrain  # Update raindrop position based on velocity
    if drawpt.y < -10:  # Reset raindrop if it falls off screen
        drawpt.y = 500  # Start raindrop from top again

def draw_points(x, y):
    glPointSize(5)
    glBegin(GL_POINTS)
    glVertex2f(x, y)
    glEnd()

def draw_lines(m, n, y, t):
    glLineWidth(5)
    glColor3f(1, 0.5, 1)
    glBegin(GL_LINES)
    glVertex2f(m, n)
    glVertex2f(y, t)
    glEnd()

def specialkeyListener(key, x, y):
    global angle
    if key == GLUT_KEY_RIGHT:
        angle += 2
        print("Right bending")
    if key == GLUT_KEY_LEFT:
        angle -= 2
        print("Left bending")
    glutPostRedisplay()

def keyboardListener(key, x, y):
    global bg_clr
    if key == b'w':
        print("w pressed")
        if bg_clr == [1, 1, 1]:
            print("DAY")
        else:
            for i in range(3):
                if bg_clr[i] < 1:
                    bg_clr[i] += 0.3
                    if bg_clr[i] > 1:
                        bg_clr[i] = 1
            print("going to day")

    if key == b'q':
        print("q pressed")
        if bg_clr == [0, 0, 0]:
            print("NIGHT")
        else:
            for i in range(3):
                if bg_clr[i] > 0:
                    bg_clr[i] -= 0.3
                    if bg_clr[i] < 0:
                        bg_clr[i] = 0
            print("going to night")
    glutPostRedisplay()

def init():
    global rain
    for i in range(600):
        x = random.uniform(0, 500)  # Start raindrops from anywhere along the x-axis
        y = random.uniform(250, 500)  # Start raindrops from top half of the window
        rain.append(Raindrop(x, y))

def iterate():
    glViewport(0, 0, 500, 500)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(0, 550, 0, 500, 0.0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()

def showScreen():
    global bg_clr, angle

    glClearColor(bg_clr[0], bg_clr[1], bg_clr[2], 1)
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()

    iterate()

    # Draw raindrops
    for drawpt in rain:
        raindrop(drawpt)
        draw_rain(drawpt)

    # Draw other elements of the scene
    draw_lines(100, 250, 400, 250)  # tri top
    draw_lines(100, 250, 250, 300)
    draw_lines(250, 300, 400, 250)

    draw_lines(100, 250, 100, 0)  # House Bo
    draw_lines(400, 250, 400, 0)
    draw_lines(100, 0, 400, 0)

    draw_lines(150, 0, 150, 130)  # Door
    draw_lines(150, 130, 200, 130)
    draw_lines(200, 130, 200, 0)

    draw_points(190, 70)  # Door Knob

    draw_lines(300, 200, 350, 200)  # Window
    draw_lines(300, 200, 300, 150)
    draw_lines(300, 150, 350, 150)
    draw_lines(350, 150, 350, 200)

    draw_lines(325, 150, 325, 200)  # Window Bars
    draw_lines(300, 175, 350, 175)

    glutSwapBuffers()

def animate():
    glutPostRedisplay()

glutInit()
glutInitDisplayMode(GLUT_RGBA)
glutInitWindowSize(1000, 1000)
glutInitWindowPosition(1, 1)
wind = glutCreateWindow(b"A house assignment 1")
glutDisplayFunc(showScreen)
glutIdleFunc(animate)
glutSpecialFunc(specialkeyListener)
glutKeyboardFunc(keyboardListener)

init()

glutMainLoop()