#!/usr/bin/env python2
for i in range(3):
    with open('./txt-file-'+str(i)+'.txt', 'wb+') as f:
        for x in {f.write, __import__('__builtin__').__dict__['print']}:
            x(str([__import__('random').__dict__['choice'](map(chr,range(97, 123))) for n in range(10)]))
print __import__('random').__dict__['randint'](1, 43) * __import__('random').__dict__['randint'](1, 43)
