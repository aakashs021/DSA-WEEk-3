void main(List<String> args) {
  Map<String, int> ma={"h":10,"e":10};
  String h="he";
  for(int i=0;i<h.length;i++){
    ma.update(h[i], (value) => 0,);
    // ma.update(h[i], (value) => value+1,ifAbsent: () => 1,);
  }
  print(ma);

  // for( var a in ma.entries){
  //   print("${a.key} : ${a.value}");
  // }
}