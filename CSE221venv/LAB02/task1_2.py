
f01 = open("C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB01\\task1_input.txt", "r")
f02 = open("C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB01\\task1_output.txt", "w")

n = f01.readline().strip("\n").split()
lenArr = int(n[0])
sum = int(n[1])
arr = f01.readline().split()
arr = [int(i) for i in arr]
print(arr)

def sum_pair(nums, x):
    num_pos = {}
    
    for i, num in enumerate(nums):
        # difference = x - num
        # if difference in num_pos:
        #     return num_pos[difference] + 1, i + 1
        # num_pos[num] = i
    
    return "IMPOSSIBLE"

N, S = map(int, input().split())
numlist = list(map(int, input().split()))

result = sum_pair(numlist, S)

print(result)

nums = [3 7 1 5]
