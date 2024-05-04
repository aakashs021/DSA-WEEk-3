
class  Minheap {
  List<int> heap=[];
heapify({required int i,required int len}){
int left=2*i+1;
int right=2*i+2;
int small=i;
if(left<len&&heap[left]<heap[small]) small=left;
if(right<len&&heap[right]<heap[small]) small=right;
if(small!=i){
  swap(i: i, j: small);
  heapify(i: small, len: len);
}
  
}
insert({required List<int> arr}){
  heap=arr;
  int n=arr.length;
  for(int i=n~/2-1;i>=0;i--){
    heapify(i: i, len: n);
  }
}
sort(){
  int n=heap.length;
  for(int i=n-1;i>=0;i--){
    swap(i: i, j: 0);
    heapify(i: 0, len: i);
  }
}
swap({required int i ,required int j}){
  int temp=heap[i];
  heap[i]=heap[j];
  heap[j]=temp;
}
}
void main(List<String> args) {
Minheap m=Minheap();
m.insert(arr: [4,8,9,4,5,12,1]);
m.sort();
print(m.heap);
  
}