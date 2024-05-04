void main(List<String> args) {
  for(int i=10;i<100;i++){
    print(i);
    
    print("${i%10}${(i/10).floor()}");
  }
}