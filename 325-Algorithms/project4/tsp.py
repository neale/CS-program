from colony import Colony
from antgraph import Graph

import sys
import traceback

num_nodes = 10

if __name__ == '__main__':
    if len(sys.argv) > 1 and sys.argv[1]:
        num_nodes = int(sys.argv[1])

    if num_nodes <= 10:
        num_ants = 20
        num_iterations =12
        num_repititions = 1
    else:
        num_ants = 28
        num_iterations = 20
        num_repititions = 1

    with open("infile.txt", "r") as f:
        data = []
        data = f.readlines()

