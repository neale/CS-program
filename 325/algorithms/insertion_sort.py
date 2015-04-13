def insertion_sort(A):
    for j in range(2, len(A)):
        key = A[j]
        i = j -1
        while i > 0 and A[i] > key:
            A[i + 1] = A[i]
            i = i - 1
        A[i + 1] = key
    return A

A = [1, 3, 6, 7, 43, 1, 3]
print A, '\n'
print insertion_sort(A)

