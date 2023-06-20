input_file_path = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB01\\task3_1_input.txt"
output_file_path = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB01\\task3_1_output.txt"

with open(input_file_path, "r") as f01:
    n = f01.readline().strip("\n").split()
    lenArr = int(n[0])

    arr = f01.readline().split()
    arr = [int(i) for i in arr]


def mergeSort(arr):
    if len(arr) <= 1:
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


with open(output_file_path, "w") as f02:
    for elem in sorted_arr:
        f02.write(str(elem) + " ")
