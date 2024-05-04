import 'dart:collection';

class Graph {
  int vertices; // Number of vertices
  late List<List<int>> adjList; // Adjacency list for storing edges, declared as late

  Graph(this.vertices) {
    adjList = List.generate(vertices, (_) => []);
  }

  // Function to add an edge to the graph
  void addEdge(int u, int v) {
    adjList[u].add(v);
    // Uncomment next line if the graph is undirected
    // adjList[v].add(u);
  }

  // Function to perform BFS traversal from a given source vertex
  void bfs(int startVertex) {
    List<bool> visited = List.filled(vertices, false);
    Queue<int> queue = Queue<int>();

    // Start by visiting the source vertex
    visited[startVertex] = true;
    queue.add(startVertex);

    while (queue.isNotEmpty) {
      int currentVertex = queue.removeFirst();
      print(currentVertex); // Process the vertex

      // Visit all the adjacent vertices of the current vertex
      for (int neighbor in adjList[currentVertex]) {
        if (!visited[neighbor]) {
          visited[neighbor] = true;
          queue.add(neighbor);
        }
      }
    }
  }
}

void main() {
  // Example usage
  Graph graph = Graph(4);
  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 2);
  graph.addEdge(2, 0);
  graph.addEdge(2, 3);
  graph.addEdge(3, 3);
  print(graph.adjList);
  print("Starting BFS from vertex 2:");
  // graph.bfs(2);
}
