f01 = open("C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB01\\task1_input.txt", "r")
f02 = open("C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB01\\task1_output.txt", "w")

n = f01.readline().strip("\n").split()
lenArr = int(n[0])
sum = int(n[1])
arr = f01.readline().split()
arr = [int(i) for i in arr]
print(arr)

flag = False
for j in range(lenArr):
  for k in range(lenArr):
    if arr[j] + arr[k] == sum:
      index01 = str(j+1)
      index02 = str(k+1)
      f02.writelines(index01+" ")
      f02.writelines(index02+" ")
      flag = True
      break
      
  if flag == True:
      break
if flag == False:
    f02.writelines("Impossible"+"\n")
