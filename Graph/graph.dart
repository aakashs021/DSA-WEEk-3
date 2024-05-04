class Graph {
  // List of lists to represent an adjacency list
  List<List<int>> adjList;

  // Constructor initializes with an empty adjacency list
  Graph() : adjList = [];

  // Function to add a vertex to the graph
  void addVertex() {
    adjList.add([]);  // Adds a new vertex with an empty list of edges
  }

  // Function to add an edge between vertex v and w
  void addEdge(int v, int w) {
    if (v >= adjList.length || w >= adjList.length) {
      print("Error: One of the vertices does not exist.");
      return;
    }
    adjList[v].add(w);
    adjList[w].add(v); // For undirected graph, remove this line for directed graph
  }

  // Function to display the graph
  void printGraph() {
    for (int i = 0; i < adjList.length; i++) {
      print('$i -> ${adjList[i]}');
    }
  }
}
void main() {
  Graph g = Graph();

  // Adding vertices
  g.addVertex(); // Vertex 0
  g.addVertex(); // Vertex 1
  g.addVertex(); // Vertex 2
  g.addVertex(); // Vertex 3
  g.addVertex(); // Vertex 4

  // Adding edges
  g.addEdge(0, 1);
  g.addEdge(0, 4);
  g.addEdge(1, 2);
  g.addEdge(1, 3);
  g.addEdge(1, 4);
  g.addEdge(2, 3);
  g.addEdge(3, 4);

  // Display the graph
  print('Graph:');
  g.printGraph();
}
