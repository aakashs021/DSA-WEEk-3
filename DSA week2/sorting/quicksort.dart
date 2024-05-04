void main(List<String> args) {
  print(quicksort(arr: [10,54,6,2,1,3,9]));
  
}
List<int>
 quicksort({required List<int>arr}){ 
  if(arr.length<2){
    return arr;
  }
int pivot=(arr.length/2).floor();
pivot=arr[pivot];
List<int> small=[];
List<int> equal=[];
List<int> large=[];
for(int i in arr){
  if(i<pivot){
    small.add(i);
  }else if(i==pivot){
    equal.add(i);
  }else{
    large.add(i);
  }
}
return [...quicksort(arr: small),...equal,...quicksort(arr: large)];
}