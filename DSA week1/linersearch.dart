void main(List<String> args) {
  print(linearsearch(arr: [1,5,8,4,6,42], number: 6));
}
String linearsearch({required List<int> arr,required int number}){
  for(int i=0;i<arr.length;i++){
   
      if(arr[i]==number){
        return "Number found";
      }
    
  }
  return 'Number not found';
}