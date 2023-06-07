try:
    myinfo = open("C:\\CODE\\TahmidRaven\\UNI\CSE221\\myinfo.txt", "w")
    
    myinfo.writelines("TahmidRaven\n")
    myinfo.writelines("21201701\n")
    
    myinfo.close()

except Exception:
    pass

with open("C:\\CODE\\TahmidRaven\\UNI\CSE221\\myinfo.txt", "r") as input01a, open("output01a.txt", "w") as output01a:
    t = int(input01a.readline())
    for i in range(t):
        n = int(input01a.readline())
        if n%2 == 0 :
            output01a.write(f"{i} is an EVEN number\n")
        else: 
            output01a.write(f"{i} is an ODD number\n")
    print(t)
            