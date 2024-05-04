void main(List<String> args) {
  print(bubblesort(arr: [8,9,20,1,2,0,9,10,11]));
}
List<int> bubblesort({required List<int> arr}){
  bool sort=true;
  for(int i=0;i<arr.length-1;i++){
    sort=true;
    for(int j=0;j<arr.length-1-i;j++){
      int temp=0;
      if(arr[j]>arr[j+1]){
        temp=arr[j];
        arr[j]=arr[j+1];
        arr[j+1]=temp;
        sort=false;
      }
    }
    if(sort){
      return arr;
      }
  }return arr;
}