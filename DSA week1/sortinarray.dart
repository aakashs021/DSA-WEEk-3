void main(List<String> args) {
  sorting(arr: [8,6,4,1,2]);
}
sorting({required List<int> arr}){
  int temp;
  for(int i=0;i<arr.length;i++){
  for(int j=0;j<arr.length;j++){
    if(arr[i]<arr[j]&&i!=j){
      temp=arr[i];
      arr[i]=arr[j];
      arr[j]=temp;
    }
  }
  }
  print(arr);
}