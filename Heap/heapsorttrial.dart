List<int> heapsort({required List<int> arr}){
  int n=arr.length;
  for(int i=n~/2;i>=0;i--){
    heapify(arr: arr, n: n, i: i);
  }
  for(int i=n-1;i>=0;i--){
    swap(a: arr, i: i, j: 0);
    heapify(arr: arr, n: i, i: 0);
  }
  return arr;
}
heapify({required List<int> arr,required int n,required int i}){
  int large=i;
  int left=2*i+1;
  int right=2*i+2;
  if(left<n&&arr[left]>arr[large])large=left;
  if(right<n&&arr[right]>arr[large])large=right;
  if(large!=i){
    swap(a: arr, i: large, j: i);
    heapify(arr: arr, n: n, i: large);
  }
}
swap({required List<int> a, required int i, required int j}){
  int temp=a[i];
  a[i]=a[j];
  a[j]=temp;
}
void main(List<String> args) {
 List<int> a= heapsort(arr: [10,8,1,3,5]);
 print(a);
}