import random

for i in range(3):
    f = open('./txt-file-'+str(i)+'.txt', 'wb+')
    nums = str(''.join([random.choice(map(chr, range(97, 123))) for n in range(10)]))
    print nums
    f.write(nums)
    f.close()
a, b = random.randint(1, 43), random.randint(1, 43)
print "{}, {}\n{}".format(a, b, a*b)
