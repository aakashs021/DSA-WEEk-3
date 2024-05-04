class Gra{
  Map<int,List<int>> adj={};

  adjvertex({required int vertex}){
    adj[vertex]??=[];
  }
  addedge({required int v1,required int v2}){
    adj[v1]??=[];
    adj[v2]??=[];
    adj[v1]!.add(v2);
    adj[v2]!.add(v1);
  }
  printgra(){
    print(adj);
  }
}
void main(List<String> args) {
  Gra g=Gra();
  g
  ..adjvertex(vertex: 2)..adjvertex(vertex: 6)
  ..adjvertex(vertex: 5)
  ..adjvertex(vertex: 7)
  ..addedge(v1: 2, v2: 5)
  ..addedge(v1: 2, v2: 8)
  ..addedge(v1: 2, v2: 7)
  ..addedge(v1: 7, v2: 6);
  g.printgra();
}