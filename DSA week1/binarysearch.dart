void main(List<String> args) {
  print(binarysearch(arr: [1,2,3,4,5], n: 8));
}
String binarysearch({required List<int> arr,required int n}){
int first=0;
int last=arr.length-1;
while(first<=last){
  int middle=(last+first) ~/2;
  if(arr[middle]==n){
    return 'Number found';
  }else if(arr[middle]<n){
    first=middle+1;
  }else{
    last=middle-1;
  }
}
return 'Number not found';
}