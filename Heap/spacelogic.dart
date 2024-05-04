void main(List<String> args) {
  String a="aakash  akdsfj  aakash   aakash";
  String b="";
  for(int i=0;i<a.length;i++){
    if(a[i]==" "){
      if(a[i]==a[i+1]){
        continue;
      }
    }
      b=b+a[i];
  }
  print(b);
}