
void main(List<String> args) {
  List<String> stack=[];
  String emp='';
String a='hello';
for(int i=0;i<a.length;i++){
stack.add(a[i]);
}
for(int i=0;i<stack.length;i++){
  emp=a[i]+emp;
}
print(emp);
}