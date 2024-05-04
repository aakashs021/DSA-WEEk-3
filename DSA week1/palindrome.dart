void main(List<String> args) {
  String a="aa";
  String b="";
  for(int i=a.length-1;i>=0;i--){
    b=b+a[i];
  }
  if(a==b){
    print('palindrome');
  }else{
    print('not');
  }
}