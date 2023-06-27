input_file_path = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB02\\task04_input.txt"
output_file_path = "C:\\CODE\\TahmidRaven\\UNI\\CSE221venv\\LAB02\\task04_output.txt"

def merge_sort(arr):
    if len(arr) <= 1:
        return arr

    mid = len(arr) // 2
    left_half = merge_sort(arr[:mid])
    right_half = merge_sort(arr[mid:])

    return merge(left_half, right_half)


def merge(left, right):
    merged = []
    i = 0
    j = 0

    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            merged.append(left[i])
            i += 1
        else:
            merged.append(right[j])
            j += 1

    while i < len(left):
        merged.append(left[i])
        i += 1

    while j < len(right):
        merged.append(right[j])
        j += 1

    return merged

with open(input_file_path, 'r') as f01:
    n = int(f01.readline().strip())
    arr = list(map(int, f01.readline().strip().split()))

sorted_arr = merge_sort(arr)

max_value = sorted_arr[-1]

with open(output_file_path, 'w') as f02:
    f02.write(str(max_value))
