void main(List<String> args) {
  String a="hello";
  String ch="";
  for(int i=0;i<a.length;i++){
    int count=0;
    bool dou=true;
    for(int j=0;j<a.length;j++){
      if(a[i]==a[j]){
      
        count++;
      }
    }
    if(ch.contains(a[i])){
      dou=false;
    }
      ch=ch+a[i];
    if(dou){

    print("count of ${a[i]} = $count");
    }
  }
}