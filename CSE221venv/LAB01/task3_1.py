f01 = open("C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB01\\task3_1_input.txt", "r")
f02 = open("C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB01\\task3_1_output.txt", "w")

n = f01.readline().strip("\n").split()
lenArr = int(n[0])

arr = f01.readline().split()
arr = [int(i) for i in arr]
# arr1 = list(map(int, f01.readline().split()))
# print(arr1)
# print(arr)


def mergeSort(arr):
    if lenArr <= 1:
        return arr
    else:
        mid = len(arr) // 2
        a1 = mergeSort(arr[:mid])
        a2 = mergeSort(arr[mid:])
        return merge(a1, a2)


def merge(a, b):
    merged = []
    i = 0
    j = 0
    
    while i < len(a) and j < len(b):
        if a[i] <= b[j]:
            merged.append(a[i])
            i += 1
        else:
            merged.append(b[j])
            j += 1
    while i < len(a):
        merged.append(a[i])
        i += 1
    while j < len(b):
        merged.append(b[j])
        j += 1
    return merged

sorted_arr = mergeSort(arr)