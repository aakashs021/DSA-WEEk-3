void main(List<String> args) {
  // print(selectionsort(arr: [1,8,9,7,9,8,9]));
  // bubblesort(arr: [1,5,8,9,5,1,2]);
  print(quicksort(arr: [4,9,1,2,4,0,-45]));

}
mergesort({required List<int> arr}){
  if(arr.length<2){
    return arr;
  }
  int mid=(arr.length/2).floor();
  List<int> f=arr.sublist(0,mid);
  List<int> l=arr.sublist(mid);
  return working(left: mergesort(arr: f), right: mergesort(arr: l));
}
List<int> working({required List<int> left,required List<int> right}){
  int lindex=0;
  List<int> sort=[];
  int rindex=0;
  while(lindex<left.length&&rindex<right.length){
    if(left[lindex]<right[rindex]){
      sort.add(left[lindex]);
      lindex++;
    }else{
      sort.add(right[rindex]);
      rindex++;
    }
  }
  while(lindex<left.length){
    sort.add(left[lindex]);
    lindex++;
  }
  while(rindex<right.length){
    sort.add(right[rindex]);
    rindex++;
  }
  return sort;
}

List<int> quicksort({required List<int> arr}){
  if(arr.length<2){
    return arr;
  }
  int pivot=arr[arr.length-1];
  List<int> s=[];
  List<int> e=[];
  List<int> l=[];
  for(int i in arr){
    if(i<pivot){
      s.add(i);
    }else if(i==pivot){
      e.add(i);
    }else{
      l.add(i);
    }
  }
  return  [...quicksort(arr: s),...e,...quicksort(arr: l)];
  // List<int> a=[...quicksort(arr: s),...e,quicksort(arr: l)];
  // print(a);
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

bubblesort({required List<int> arr}){
  for(int i=0;i<arr.length;i++){
    for(int j=0;j<arr.length-1;j++){
      if(arr[j]<arr[j+1]){
        int temp=arr[j];
        arr[j]=arr[j+1];
        arr[j+1]=temp;
      }
    }
  }
  print(arr);
}

selectionsort({required List<int> arr}){
  for(int i=0;i<arr.length;i++){
    for(int j=0;j<arr.length;j++){
      if(arr[i]<arr[j]){
        int temp=arr[i];
        arr[i]=arr[j];
        arr[j]=temp;
      }
    }
  }
  print(arr);
}