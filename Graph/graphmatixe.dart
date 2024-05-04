class g{
  List<List<int>> gra=[];
  int size;
  g({required this.size}){
    gra=List.generate(size, (_) => List.filled(size, 0));
  }
  addedge({required int v1,required int v2}){
    if(v1>=0&&v1<size&&v2>=0&&v2<size){

    gra[v1][v2]=1;
    }
  }
  display(){
    print(gra);
  }
}
void main(List<String> args) {
  g ga=g(size: 10);
  ga..addedge(v1: 1, v2: 5)
  ..addedge(v1: 7, v2: 3)
  ..addedge(v1: 3, v2: 5)
  ..display();
}