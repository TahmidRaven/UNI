from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *
import random
import math

frame_w  = 800
frame_h = 600
bubble = []
bullet = []
shooter_x = 0 
shooter_y = -270 
shooter_r = 30
score = 0 
shotmiss = 0 
bubblemiss = 0 
speed = 0.2
end= False 
pauseg = False


def points_draw(x,y):
    glPointSize(1)
    glBegin(GL_POINTS)
    glVertex2f(x,y)
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


class circle:
    def __init__(self,x,y,r):

        self.x = x
        self.y = y
        self.r = r
    
def circle_octant(x,y,cx,cy):
    points_draw(x + cx, y + cy)
    points_draw(y + cx, x + cy)
    points_draw(y + cx, -x + cy)
    points_draw(x + cx, -y + cy)
    points_draw(-x + cx, -y + cy)
    points_draw(-y + cx, -x + cy)
    points_draw(-y + cx, x + cy)
    points_draw(-x + cx, y + cy)

def midpoint_circle(cx,cy,r):
    d = 1 - r
    x = 0 ; y = r
    while (x <= y):
        circle_octant(x,y,cx,cy)
        if d < 0:
            d = d + 2*x + 3
            x += 1
        else:
            d = d + 2*x -2*y + 5
            x += 1
            y -= 1


def overlapping(ball):
    global bubble
    for blb in bubble:
        rad = blb.r + ball.r
        distance = math.sqrt((blb.x - ball.x) ** 2 + (blb.y - ball.y) ** 2)
        if distance <= rad :
            return True
    return False      

def create_bubble():
    global bubble, end , pauseg
    if len(bubble) < 7 and end == False :
        r = random.randrange(13,48)
        x = random.randrange(-400+r,400-r)
        y = 300-(r+80)

        glColor3d(1.0,1.0,0)
        new_bubble = circle(x,y,r)
        if overlapping(new_bubble) == False:
            bubble.append(new_bubble)
            
        else:
            create_bubble()

def fallBubble():
    global bubble, bubblemiss,speed
    if bubblemiss >= 3:
        GameOver()
    for fall in bubble:
        fall.y -= speed
        if fall.y + fall.r <= -300:
            bubble.remove(fall)
            bubblemiss += 1
            create_bubble()


def BulletShoot():
    global bullet, bubble, score, shotmiss, speed

    b_i = 0
    while b_i < len(bullet):
        new_bullet = bullet[b_i]
        new_bullet.y += 15  
        
        if new_bullet.y + new_bullet.r >= 300:    #bullet for reaching top
            bullet.pop(b_i)
            shotmiss += 1
 

            if shotmiss == 3:
                GameOver()
                return

        else:
            bubble_collide = False
            for j in bubble:
                target= new_bullet.r + j.r
                real_dist = math.sqrt((new_bullet.x - j.x) ** 2 + (new_bullet.y - j.y) ** 2)

                if real_dist <= target:
                    # collides with bubble
                    score += 1
                    speed += 0.01

                    bullet.pop(b_i)  # Remove bullet
                    bubble.remove(j)  # Remove bubble
                    create_bubble()

                    print(f"Score: {score}")
                    bubble_collide = True
                    break  

            if bubble_collide == False:
                b_i += 1  
            



def BubbleDraw():

    global bubble,shooter_x,shooter_y,shooter_r

    for i in bubble :
        rad = i.r + shooter_r
        distance = math.sqrt((i.x - shooter_x) ** 2 + (i.y - shooter_y) ** 2)
        if distance <= rad:
            GameOver()
            break
        midpoint_circle(i.x,i.y,i.r)

def BulletDraw():

    global bullet

    for i in bullet:

        midpoint_circle(i.x,i.y,i.r)


def GameOver():

    global end,bubble , bullet

    end = True
    print(f"Game_over! Final Score {score}")
    bubble = []
    bullet = []

def ResetGame():

    global bubble, bullet,shooter_x,shooter_y,shooter_r,score,shotmiss,bubblemiss,end

    bubble = []
    bullet= []
    shooter_x = 0 
    shooter_y = -270
    shooter_r = 30
    score = 0 
    shotmiss = 0 
    bubblemiss = 0 
    end= False 
    pauseg = False 
    speed = 0.5


def keyboardListener(key, x, y):

    global shooter_x,shooter_y,shooter_r,bullet,pauseg,end

    if end == False and pauseg == False:
        if key == b'a':
            var = shooter_x - shooter_r
            if var - 14 >= -400:
                shooter_x -= 14

        if key == b'd':
            var = shooter_x+shooter_r
            if var + 14 <= 400:
                shooter_x += 14

        if key == b' ':
            glColor3d(1.0,1.0,0)
            shot = circle(shooter_x,shooter_y,5)
            bullet.append(shot)


def mouseListener(button, state, x, y):
    global pauseg, score
    if button == GLUT_LEFT_BUTTON and state == GLUT_DOWN:
        if 0 <= x <= 48 and 0 <= y <= 32 :
            print("Starting Over")
            ResetGame()

        if 370 <= x <= 420 and 0 <= y <= 55 :
            if pauseg == False:
                pauseg = True
                print("pause")
            elif pauseg == True:
                pauseg = False
                print("resume")
                
        if 640 <= x <= 780 and 0 <= y <= 58 :
                print(f"Goodbye! Score: {score}")
                glutLeaveMainLoop()
    glutPostRedisplay()

def showScreen():
    global shooter_x,shooter_y,shooter_r
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
    glLoadIdentity()
    iterate()

    #draw shooter
    midpoint_circle(shooter_x,shooter_y,shooter_r)
    create_bubble()
    BubbleDraw()
    BulletDraw()

    # reset button

    glColor3d(0.2,0.33,0.65)
    dline(-385,270,-367,288)
    dline(-385,270,-367, 252)
    dline(-385,270,-340,270)

    # cancel button

    glColor3d(1.0,0.0,0)
    dline(340,260,360,240)
    dline(340,240,360,260)

    # play pause button
    glColor3d(1.0,1.0,0)
    
    if pauseg == False:

        dline(-15,265,-15,235)
        dline(15,265,15,235)
    
    elif pauseg == True:

        dline(-15,265,-15,235)
        dline(-15,265,15,255)
        dline(-15,235,15,255)
    glutSwapBuffers()

def animate():
    global end, pauseg
    if end == False:
        if pauseg == False:
            fallBubble()
            BulletShoot()

    glutPostRedisplay()

def iterate():
    glViewport(0, 0, 800, 600)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    glOrtho(-400, 400, -300, 300, 0.0, 1.0)
    glMatrixMode (GL_MODELVIEW)
    glLoadIdentity()


glutInit()
glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGB)
glutInitWindowSize(frame_w,frame_h) 
glutInitWindowPosition(500,10)
frame = glutCreateWindow(b"bubble shooter game")
glutDisplayFunc(showScreen)
glutIdleFunc(animate)
glutKeyboardFunc(keyboardListener)
glutMouseFunc(mouseListener)

glutMainLoop()

    