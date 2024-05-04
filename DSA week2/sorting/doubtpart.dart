void main(List<String> args) {
  print(fun());
}
String fun(){
  bool newvar=false;
  int numb=1;
  for(int i=0;i<5;i++){
    print('worked of i $i');
    for(int j=0;j<5;j++){
      print("working of j $j");
      if(numb!=1){
        newvar=true;

      }
    }
    if(!newvar){break;
      // return "incomp";
    }
  }return 'comp';
}