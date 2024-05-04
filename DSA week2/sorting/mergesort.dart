List<int> mergesort({required List<int>arr}){
  if(arr.length<2){
return arr;
  }
  int mid=(arr.length/2).floor();
  List<int> first=arr.sublist(0,mid);
  List<int> last=arr.sublist(mid);

  return working(first: mergesort(arr: first), last: mergesort(arr: last));
  
}
List<int> working({required List<int> first,required List<int> last}){
  List<int> sort=[];
  int leftindex=0;
  int rightindex=0;
  while(leftindex<first.length&&rightindex<last.length){
    if(first[leftindex]<last[rightindex]){
      sort.add(first[leftindex]);
      leftindex++;
    }else{
      sort.add(last[rightindex]);
      rightindex++;
    }
  }
  while(leftindex<first.length){
    sort.add(first[leftindex]);
    leftindex++;
  }
  while(rightindex<last.length){
    sort.add(last[rightindex]);
    rightindex++;
  }

  return sort;
}
void main(List<String> args) {
 print( mergesort(arr: [5,4,8,7,9,5,6,1,1]));
}