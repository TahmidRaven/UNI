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


with open("C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB02\\task03_input.txt", "r") as f01, \
     open("C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB02\\task03_output.txt", "w") as f02:

    n = int(f01.readline().strip())
    arr = list(map(int, f01.readline().split()))

    sorted_arr = mergeSort(arr)

    f02.write(" ".join(map(str, sorted_arr)))

# time complexity of the merge sort algo is O(nlogn). 