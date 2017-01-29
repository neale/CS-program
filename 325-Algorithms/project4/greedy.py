import math
import sys

min_storage = []

def TSP():
    if len(sys.argv) >= 2:

        f = open(sys.srgv[1],"r")

    else: 

        f = open("TSP_Files-1/tsp_example_3.txt","r")

    x = []
    y = []
    for line in f:
        x.append(map(int,line[0:len(line)-1].split()))
        y.append(map(int,line[0:len(line)-1].split()))

    #x=[[0,280,133],[1,288,149],[2,288,129],[3,270,133],[4,256,141]]
    
    f.close()
    start = x[0]

    distance = 0
    last_index = 0
    min_index = 0
    temp_index = 0

    furthestIndex = 0
    globalMax = 0

    while(y.count(None) < len(y) - 1):
        min = sys.maxint
        max = 0
        index = 0
        for i in range(1,len(y)):
            
            if y[i] != None:
                
                print y[i]
                if i != temp_index:

                    temp = round(math.sqrt((y[i][1] - y[temp_index][1]) ** 2 + (y[i][2] - y[temp_index][2]) ** 2))

                if temp < min:

                    min=temp
                    min_index=i

                elif temp > 0:

                    max = temp
                    index = i

    if max > globalMax:

        globalMax = max
        furthestIndex = index

    temp_index = min_index  
    y[last_index]=None
    last_index = min_index

    distance = 0
    last_index = 0
    min_index = 0
    temp_index = furthestIndex

    while(x.count(None)<len(x)-1):
        
        min = sys.maxint
        
        for i in range(1,len(x)):
            if x[i] != None:
                if i != temp_index:
                    temp = round(math.sqrt((x[i][1] - x[temp_index][1])**2 +(x[i][2] - x[temp_index][2])**2))
                    if temp < min:
                        min = temp
                        min_index = i
        
        temp_index = min_index
        min_storage.append(min)
        distance = distance + min
        x[last_index] = None
        last_index = min_index

    print('Finish')
    distance = distance + round(math.sqrt((x[min_index][1] - start[1])**2 + (x[min_index][2] - start[2])**2 ))
    return distance

print TSP()

with open("output.txt", "a") as f:
    f.write(distance)
    for item in min_storage:
        f.write(item + '\n')   
    f.close()


