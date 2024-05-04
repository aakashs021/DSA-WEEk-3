class Maxheap{
  List<int> heap=[];

  insert({required int val}){
    heap.add(val);
    bubbleup();
  }
  bubbleup(){
    int index=heap.length-1;
    while(index>0){
      int parent=(index-1)~/2;
      if(heap[index]>heap[parent]){
          swap(i: index, j: parent);
      }
      index=parent;
    }
  }
  remove(){
    if(heap.isNotEmpty){
      heap[0]=heap.removeLast();
      if(heap.isNotEmpty)bubbledown(i: 0);
    }
  }
  bubbledown({required int i}){
    int left=2*i+1;
    int right=2*i+2;
    int large=i;
    if(left<heap.length&&heap[left]>heap[large])large=left;
    if(right<heap.length&&heap[right]>heap[large])large=right;
    if(large!=i){
      swap(i: large, j: i);
      bubbledown(i: large);
    }
  }

    swap({required int i,required int j}){
    int temp=heap[i];
    heap[i]=heap[j];
    heap[j]=temp;
  }

  sort(){
    int n=heap.length;
    for(int i=n-1;i>=0;i--){
      swap(i: i, j: 0);
      heapify( lenght: i, i: 0);
    }
  }
  heapify({required int lenght,required int i}){
    int left=2*i+1;
    int right=2*i+2;
    int large=i;
    if(left<lenght&&heap[left]>heap[large])large=left;
    if(right<lenght&&heap[right]>heap[large])large=right;
    if(large!=i){
      swap(i: large, j: i);
      heapify( lenght: lenght,i: large);
    }
  }
}void main(List<String> args) {
  Maxheap m=Maxheap();
  m..insert(val: 4)
  ..insert(val: 8)
  ..insert(val: 7)
  ..insert(val: 1)
  ..insert(val: 9);
  m.sort();
  print(m.heap);
}