import sys
def bottom_up(lst, n):

  newlst = [x for x in lst]
  newlst[0] = 0
  for j in range(1, n):
    q = -sys.maxint
    for i in range(1, j):
      q = max(q, lst[i], newlst[j-i])
    newlst[j] = q
  return newlst[n]

lst = [1, 2, 3, 4, 7, 8, 9, 0, 3, 5, 4, 6]
print bottom_up(lst, lst[-1])

