void main(List<String> args) {
  List<int> a=mergesort(arr: [9,5,4,2,3,1,9,9]);
  
  print(a);
}

List<int> mergesort({required List<int>arr}){
  if(arr.length<2){
    return arr;
  }
  int mid=arr.length~/2;
  List<int> leftarr=arr.sublist(0,mid);
  List<int> rightarr=arr.sublist(mid);
  return sorting(right: mergesort(arr: leftarr), left: mergesort(arr: rightarr));
}
List<int> sorting({required List<int> right,required List<int> left}){
  int f=0;
  int r=0;
  List<int> sort=[];
  while(f<left.length&&r<right.length){
    if(left[f]<right[r]){
      sort.add(left[f]);
      f++;
    }else{
      sort.add(right[r]);
      r++;
    }
  }
  while(f<left.length){
    sort.add(left[f]);
    f++;
  }
  while(r<right.length){
    sort.add(right[r]);
    r++;
  }
  return sort;
}

List<int> quicksort({required List<int> a}){
  int pivot=a[(a.length~/2)];
  List<int> s=[];
  List<int> e=[];
  List<int> l=[];
  for(int i=0;i<a.length;i++){
    if(a[i]<pivot){
      s.add(a[i]);
    }else if(a[i]==pivot){
      e.add(a[i]);
    }else{
      l.add(a[i]);
    }
  }return [...quicksort(a: s),...e,...quicksort(a: l)];
}

List<int> insertionsort({required List<int> a}){
  for(int i=1;i<a.length;i++){
    int newvar=a[i];
    int j=i-1;
    while(j>=0&&a[j]>newvar){
      a[j+1]=a[j];
      j=j-1;
    }
    a[j+1]=newvar;
  }
  return a;
}

List<int> bubblesort({required List<int> a}){
  for(int i=0;i<a.length;i++){
    for(int j=0;j<a.length-1-i;j++){
      if(a[j]>a[j+1]){
        int temp=a[j];
        a[j]=a[j+1];
        a[j+1]=temp;
      }
    }
  }
  return a;
}

List<int> selectionsort({required List<int> a}){
  for(int i=0;i<a.length;i++){
    for(int j=0;j<a.length;j++){
      if(a[i]<a[j]){
        int temp=a[i];
        a[i]=a[j];
        a[j]=temp;
      }
    }
  }
  return a;
}