void main(List<String> args) {
  print(fact(n: 5));
}
int fact({required int n}){
  if(n<2){
    return 1;
  }else{
    return n*fact(n: n-1);
  }
}