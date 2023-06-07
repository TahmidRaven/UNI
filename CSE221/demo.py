f = open("C:\\CODE\\TahmidRaven\\UNI\\CSE221\\demo.txt", "r")
print(f.read())

f.close()

with open("C:\\CODE\\TahmidRaven\\UNI\\CSE221\\demo.txt" , "r") as input01a, open("input01a.txt" , "w") as output01a: 
    t = input01a.readline()
    for i in range(t):
        i = int(input01a.readline())
    
 