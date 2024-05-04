class Minheap{
  List<int> heap=[];

  add({required int data}){
    heap.add(data);
    bubbleup();
  }

  bubbleup(){
    int index=heap.length-1;
    while(index>0){
      int parent=(index-1)~/2;
      if(heap[parent]>heap[index])swap(i: parent, j: index);
      index=parent;
    }
  }
  remove(){
    if(heap.isEmpty){
      print('it is empty');
    }else{
      heap[0]=heap.removeLast();
      if(heap.isNotEmpty)bubbledown(index: 0);
    }
  }
  bubbledown({required int index}){
    int leftChild=index*2+1;
    int rightChild=index*2+2;
    int small=index;

    if(small<heap.length&&heap[leftChild]<heap[small])small=leftChild;
    if(rightChild<heap.length&&heap[rightChild]<heap[small])small=rightChild;
    if(small!=index){
      swap(i: small, j: index);
      bubbledown(index: small);
    }
  }

  swap({required int i,required int j}){
    int temp=heap[i];
    heap[i]=heap[j];
    heap[j]=temp;
  }
}