void main(List<String> args) {
  print(selectionsort(arr: [5,7,8,1,2,3,4,5]));
}
List<int> selectionsort({required List<int> arr}){
  for (var i = 0; i < arr.length; i++) {
    for (var j = 0; j < arr.length; j++) {
      int temp=0;
      if(arr[i]<arr[j]){
          temp=arr[i];
          arr[i]=arr[j];
          arr[j]=temp;
      }
    }
  }return arr;
}