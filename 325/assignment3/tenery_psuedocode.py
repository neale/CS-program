
function tenery_search(list A, x):

  if length(A) <= 1:
    if A = x return true
    else return false

  else:
    if x > element at length(A) * 1/3 
      if x > element at length(A) * 2/3
        b = top third of A
      else:
        b = middle third of A
    else:
      b = first third of A

  return tenery_search(b, x)
