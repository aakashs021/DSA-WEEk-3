void main(List<String> args) {
  List<int> arr=[15,23,4,5,74,8,47,99];
  for(int i=0;i<arr.length;i=i+2){
    print("${arr[i]} ${arr[i+1]}");
    if(i+1<arr.length){
      print("${arr[i+1]} ${arr[i]}");
    }
  }
}