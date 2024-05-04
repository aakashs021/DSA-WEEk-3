class Maxheap{
  List<int> heap=[];

  add({required int data}){
    heap.add(data);
    bubbleup(index: heap.length-1);
  }
  bubbleup({required int index}){
    while(index>0){
      int parent=(index-1)~/2;
      if(heap[parent]<heap[index]){
        swap(i: parent, j: index);
      }
        index=parent;
    }
  }
  remove(){
    if(heap.isEmpty){
      print('Its empty');return;
    }
    heap[0]=heap.removeLast();
    if(heap.isNotEmpty)bubbledown(index: 0);
    
  }
  bubbledown({required int index}){
    int leftChild=index*1+1;
    int rightChild=index*2+2;
    int large=index;
    if(leftChild<heap.length&&heap[leftChild]>heap[large])large=leftChild;
    if(rightChild<heap.length&&heap[rightChild]>heap[large])large=rightChild;
    if(large!=index){
      swap(i: large, j: index);
      bubbledown(index: large);
    }
  }

  swap({required int i,required int j}){
    int temp=heap[i];
    heap[i]=heap[j];
    heap[j]=temp;
  }
}
void main(List<String> args) {
  Maxheap m=Maxheap();
  m..add(data: 10)..add(data: 20)..add(data: 55);
  print(m.heap);
  m.remove();
  print(m.heap);
}