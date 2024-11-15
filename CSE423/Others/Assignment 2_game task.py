from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import random

window_w = 500
window_h = 800
speed = 0.001

catcher_x = 0
catcher_y = 50
pause_game = False
diamond_x = random.randint(-240, 240)
diamond_y = 200
diamond_width = 20
diamond_height = 10

score = 0


def draw_points(x, y):
    glPointSize(3)
    glBegin(GL_POINTS)
    glVertex2f(x, y)
    glEnd()


def draw_line(x1, y1, x2, y2):
    zone = current_zone(x1, y1, x2, y2)
    x1, y1, x2, y2 = zone_m_to_zone_0(zone, x1, y1, x2, y2)
    points = midpoint_line(x1, y1, x2, y2)
    zone_0_to_zone_m(zone, points)


def midpoint_line(x1, y1, x2, y2):
    points = []  # stores the coordinates of the pixels that constitute the line being drawn
    dx = x2 - x1
    dy = y2 - y1
    d = dy - (dx / 2)
    x = int(x1)
    y = int(y1)
    points += [[x, y]]

    for x in range(int(x1) + 1, int(x2) + 1):
        if d < 0:
            d += dy
        else:
            d += (dy - dx)
            y += 1
        points += [[x, y]]

    return points


def current_zone(x1, y1, x2, y2):
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


def zone_m_to_zone_0(zone, x1, y1, x2, y2):
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


def zone_0_to_zone_m(zone, points):
    if zone == 0:
        for x, y in points:
            draw_points(x, y)
    elif zone == 1:
        for x, y in points:
            draw_points(y, x)
    elif zone == 2:
        for x, y in points:
            draw_points(-y, x)
    elif zone == 3:
        for x, y in points:
            draw_points(-x, y)
    elif zone == 4:
        for x, y in points:
            draw_points(-x, -y)
    elif zone == 5:
        for x, y in points:
            draw_points(-y, -x)
    elif zone == 6:
        for x, y in points:
            draw_points(y, -x)
    elif zone == 7:
        for x, y in points:
            draw_points(x, -y)


def diamonds(x, y, width, height):
    draw_line(x, y, x + width // 2, y - height)  # top edge of the diamond
    draw_line(x + width // 2, y - height, x + width, y)  # bottom edge of the diamond
    draw_line(x, y, x + width // 2, y + height)  # left edge of the diamond
    draw_line(x + width // 2, y + height, x + width, y)  # right edge of the diamond


def display():
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glClearColor(0, 0, 0, 0);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
    gluLookAt(0, 0, 200, 0, 0, 0, 0, 1, 0)
    glMatrixMode(GL_MODELVIEW)

    """Diamond"""
    global diamond_x, diamond_y, diamond_width, diamond_height
    # diamond_color = (random.random(), random.random(), random.random())
    glColor3f(0.79, 0.93, 0.87)
    diamonds(diamond_x, diamond_y, diamond_width, diamond_height)
    if diamond_y <= -250:
        diamond_x = random.randint(-240, 240)
        diamond_y = 200

    """Play-Pause Button"""
    glColor3f(0.98, 0.92, 0.37)
    if pause_game:
        draw_line(-10, 225, 10, 235)
        draw_line(10, 235, -10, 245)
        draw_line(-10, 245, -10, 225)
    else:
        draw_line(-4, 225, -4, 245)
        draw_line(4, 225, 4, 245)

    """Restart Button"""
    glColor3f(0.44, 0.68, 0.94)
    draw_line(-240, 235, -230, 245)
    draw_line(-240, 235, -230, 225)
    draw_line(-240, 235, -215, 235)

    """Exit Button"""
    glColor3f(0.88, 0.21, 0.21)
    draw_line(240, 225, 220, 245)
    draw_line(240, 245, 220, 225)

    """Diamond Catcher"""
    global catcher_x, catcher_y
    glColor3f(0.96, 0.97, 0.87)
    # draw_line(-70, -240, 70, -240)
    # draw_line(-50, -250, 50, -250)
    # draw_line(-50, -250, -70, -240)
    # draw_line(50, -250, 70, -240)
    draw_line(catcher_x - 70, -235, catcher_x + 70, -235)
    draw_line(catcher_x - 50, -250, catcher_x + 50, -250)
    draw_line(catcher_x - 50, -250, catcher_x - 70, -235)
    draw_line(catcher_x + 50, -250, catcher_x + 70, -235)

    glutSwapBuffers()


# moving the catcher
def keyboard_listener(key, x, y):
    global catcher_x

    val = 20
    if key == GLUT_KEY_LEFT:
        if catcher_x - 70 <= -250:  # left boundary
            pass
        else:
            if not pause_game:
                catcher_x -= val

    if key == GLUT_KEY_RIGHT:
        if catcher_x + 70 >= 250:  # right boundary
            pass
        else:
            if not pause_game:
                catcher_x += val

    glutPostRedisplay()


def mouse_listener(button, state, x, y):
    global catcher_x, catcher_y, diamond_x, diamond_y, pause_game
    if button == GLUT_LEFT_BUTTON:
        if state == GLUT_DOWN:
            # print(f"Mouse clicked at: {x}, {y}")
            # Play-Pause button region
            if 230 <= x <= 260 and 0 <= y <= 50:
                # print("Play - Pause Button Clicked")
                pause_game = not pause_game  # Toggle the pause state
            # Restart button region
            elif 10 <= x <= 30 and 25 <= y <= 40:
                print("Starting Over!")
                print("-----------------------------")
                catcher_x = 0
                catcher_y = 50
                diamond_x = random.randint(-240, 240)
                diamond_y = 200
                pause_game = False
            # Exit Button region
            elif 445 <= x <= 490 and 10 <= y <= 50:
                glutLeaveMainLoop()

        glutPostRedisplay()  # Redraw the scene


def iterate():
    glViewport(0, 0, 500, 500)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(0.0, 500, 0.0, 500, 0.0, 1.0)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()


def animate():
    global diamond_y, diamond_x, catcher_x, catcher_y, pause_game, speed, score

    if not pause_game:
        diamond_y -= speed  # diamonds falling
        speed += 0.0001  # increase the diamond speed
        # checks if the diamond is within the catcher's range (x-axis)
        if (catcher_x - 70 <= diamond_x <= catcher_x + 70) and (diamond_y <= -240):
            score += 1
            print("Score:", score)
            # Reset diamond position
            diamond_x = random.randint(-240, 240)
            diamond_y = 200
        # diamond fell off the screen without being caught
        elif diamond_y <= -250:
            print("Game Over! Final Score:", score)
            print("-----------------------------")
            # reset the game
            diamond_x = random.randint(-240, 240)
            diamond_y = 200
            score = 0
            catcher_x = 0
            catcher_y = 50
            speed = 0.01
            pause_game = False

    if pause_game:
        diamond_y = diamond_y
    else:
        diamond_y = (diamond_y - speed)
    glutPostRedisplay()


def init():
    glClearColor(0, 0, 0, 0)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    gluPerspective(104, 1, 1, 1000.0)


glutInit()
glutInitWindowSize(window_w, window_h)
glutInitWindowPosition(500, 0)
glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGB)
window = glutCreateWindow(b"Catch The Diamond")
init()
glutDisplayFunc(display)
glutIdleFunc(animate)
glutSpecialFunc(keyboard_listener)
glutMouseFunc(mouse_listener)
glutMainLoop()
