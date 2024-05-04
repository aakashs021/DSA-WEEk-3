void main(List<String> args) {
  print(binarysearchrecursion(arr: [4,5,6,8,7,9,1], target: 9));
}
String binarysearchrecursion({required List<int> arr,required int target}){
  int low=0;
  int high=arr.length-1;
  if(low<=high){

  int mid=(low+high)~/2;
  if(arr[mid]==target){
    return 'Number found is ${arr[mid]}';
  }
  if(arr[mid]<target){
    List<int> newarr=arr.sublist(mid+1);
    return binarysearchrecursion(arr: newarr,target: target);
  }else if(arr[mid]>target){
    List<int> newarr=arr.sublist(0,mid);
    return binarysearchrecursion(arr: newarr,target: target);
  }
  
  }
    return 'Nothing found';
   
}