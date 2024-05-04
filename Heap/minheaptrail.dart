class Minheap {
  List<int> heap = [];
  insert({required int data}) {
    heap.add(data);
    bubbleup(index: heap.length - 1);
  }
  remove(){
    if(heap.isNotEmpty){
      // int result=heap.first;
      heap[0]=heap.removeLast();
      bubbledown(index: 0);
    }
  }
   printleftsubtree({required int index}){
    if(index<heap.length){
      print(heap[index]);
      printleftsubtree(index: 2*index+1);
      printleftsubtree(index: 2*index+2);
    }
  }

  bubbledown({required int index}){
      int leftChild=(index*2)+1;
      int rightChild=(index*2)+2;
      int smallest=index;
      if(leftChild<heap.length&&heap[leftChild]<heap[smallest])smallest=leftChild;
      if(rightChild<heap.length&&heap[rightChild]<heap[smallest])smallest=rightChild;
      if(smallest!=index){
        swap(n1: smallest, n2: index);
        bubbledown(index: smallest);
      }
  }

  bubbleup({required int index}) {
    while (index > 0) {
      int parent = (index - 1) ~/ 2;
      if (heap[parent] > heap[index]) {
        swap(n1: parent, n2: index);
        index = parent;
      } else {
        break;
      }
    }
  }

  swap({required int n1, required int n2}) {
    int temp = heap[n1];
    heap[n1] = heap[n2];
    heap[n2] = temp;
  }
}

void main(List<String> args) {
  Minheap m = Minheap();
  m
    ..insert(data: 10)
    ..insert(data: 15)
    ..insert(data: 8)
    ..insert(data: 20)
    ..insert(data: 17)
    ..insert(data: 13)
    ..insert(data: 50)
    ..insert(data: 4)
    ;
  print(m.heap);
    m.remove();
  print(m.heap);
    // m.printleftsubtree(index: 2);
  // m..remove();
  // m..remove();
  // m..remove();
  // print(m.heap);
}
