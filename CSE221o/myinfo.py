try:
    myinfo = open("C:\\CODE\\TahmidRaven\\UNI\CSE221o\\myinfo.txt", "w")
    
    myinfo.writelines("TahmidRaven\n")
    myinfo.writelines("21201701\n")
    
    myinfo.close()

except Exception:
    pass