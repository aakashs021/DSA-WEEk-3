void main(List<String> args) {
  insertionsort(arr: [4,5,1,0,-45,45]);
}
insertionsort({required List<int> arr}){
for(int i=1;i<arr.length;i++){
  int newvar=arr[i];
  int j=i-1;
  while(j>=0&&arr[j]>newvar){
    arr[j+1]=arr[j];
    j=j-1;
  }
  j=j+1;
  arr[j]=newvar;
}
print(arr);
}