#!/usr/bin/env python2
for i in range(3):
    with open('./txt-file-'+str(i)+'.txt', 'wb+') as f:
        for x in {f.write, __import__('__builtin__').__dict__['print']}:
            x(str(''.join(([__import__('random').__dict__['choice'](map(chr,range(97, 123))) for n in range(10)]))))
a , b = __import__('random').__dict__['randint'](1, 43),__import__('random').__dict__['randint'](1, 43)
print "{}, {}\n{}".format(a, b, a*b)
#really couldn't figure a way to do line 6 and 7 in one line. Python doesn't actuall eval in a print statement. 
