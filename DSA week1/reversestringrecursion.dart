void main(List<String> args) {
print(fun(s: 'hello'));
  // print(rever);
}
String rever="";
 String fun({ String? s}){
    if(s == null){
return "Nothing";
    }else if(s.length==0){
return rever;
    }
    rever=s[0]+rever;
    String b=s.substring(1);
    return fun(s: b);
  }
