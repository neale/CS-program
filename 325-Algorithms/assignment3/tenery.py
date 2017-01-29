import sys
from random import randint

def tenery(lst):

  
  if len(lst) > 1:
    tenery(list(lst[:(len(lst)//3)]))
    tenery(list(lst[(len(lst)//3)+1:((len(lst)//3)*2)]))
    tenery(list(lst[(len(lst)//3)*2:]))
  else:
    return num
  
lst = [randint(0, 19)] * 20
tenery(lst);
print "completed"
