with open("C:\\CODE\\TahmidRaven\\UNI\\CSE221o\\input01a.txt", "r") as input01a, open("output01a.txt", "w") as output01a:
    t = int(input01a.readline())
    for i in range(t):
        i = int(input01a.readline())
        if i%2 == 0 :
            output01a.write(f"{i} is an EVEN number\n")
        else: 
            output01a.write(f"{i} is an ODD number\n")
    print(t)