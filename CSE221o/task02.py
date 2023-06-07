with open("C:\\CODE\\TahmidRaven\\UNI\\CSE221o\\task02input01.txt", "r") as task02input01, open("C:\\CODE\\TahmidRaven\\UNI\\CSE221o\\task02output01.txt", "w") as task02output01:
    t = int(task02input01.readline())
    
    arr = list(int(task02input01.readline()))
    
    def bubble_sort(arr):
        n = len(arr)
        for i in range(n):
            swapped = False
            for j in range(0, n-i-1):
                if arr[j] > arr[j + 1]:
                    arr[j], arr[j + 1] = arr[j + 1], arr[j]
                    swapped = True
            if not swapped:
                break


bubble_sort(arr)
print(arr)