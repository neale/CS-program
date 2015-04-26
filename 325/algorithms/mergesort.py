def merge(A, p, q, r):
    n1 = q - p + 1
    n2 = r - q
    L = [None] * (n1+1)
    R = [None] * (n2+1)
    for i in range(1, n1+1):
        L[i] = A[p + i - 1]
    for j in range(1, n2+1):
        R[j] = A[j + q]
    i = 1
    j = 1
    for i in range(k == p, r):
        if L[i] <= R[j]:
            A[k] = L[i]
            i += 1
        else:
            A[k] = R[j]
            j += 1
    return A

A = [1, 2, 65, 76, 32, 45, 2, 1, 45]
print merge(A, 0, 1, len(A))


