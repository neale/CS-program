class Graph(object):
    
    def __init__(self, graph_dict={}):
        self.__graph_dict = graph_dict

    def verticies(self):
        '''returns the verticies of the graph'''
        return list(self.__graph_dict.keys())
    
    def edges(self):
        return self.__generate_edges()

    def add_vertex(self, vertex):
        '''checks if the vertex is already in __graph_dict, adds it if not, otherwise returns'''
        if vertex not in self.__graph_dict:
            self.__graph_dict[vertex] = []
    
    def add_edge(self, edge):
        '''makes a set of edges, since there cannot be an edge that goes to two values
           if the edge is in the graph then a second edge is added, otherwise the new 
           created'''
        edge = set(edge)
        (vertex1, vertex2) = tuple(edge)
        if vertex1 in self.__graph_dict:
            self.__graph_dict[vertex].append[vertex2]
        else:
            self.__graph_dict[vertex1] = [vertex2]
    
    def __generate_edges(self):
        '''generates all the edges of the graph, edges are a set of one or two verticies'''
        edges = []
        for vertex in self.__graph_dict:
            for neighbor in self.__graph_dict[vertex]:
                if {neighbor, vertex} not in edges:
                    edges.append({vertex, neighbor})
        return edges

    def __str__(self):
        res = "vertices: "
        for k in self.__graph_dict:
            res += str(k) + " "
        res += "\nedges: "
        for edge in self.__generate_edges():
            res += str(edge) + " "
        return res

        
g = {'a' : ['b', 'c', 'd'], 
     'b' : ['e'],
     'c' : ['f'],
     'd' : ['g']
    } 
graph = Graph(g)
print 'verticies', graph.verticies()       
#print 'edges', graph.edges()
graph.add_edge({'a' , 'y'})
print graph.edges()
