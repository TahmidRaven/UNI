#! Creation

from array import *

arr1 = array("i", [1,2,3,4,5])

for i in arr1:
    print(i)
    
print(arr1[len(arr1)-1])
print(arr1[4])

#! Insertion

arr1.insert(2,9)
print(arr1[2])

#! Deletion

arr1.remove(5)
print(arr1)

#! Search

print(arr1.index(9))

#! Update

arr1[3] = 69
print(arr1[3])
print(arr1)

