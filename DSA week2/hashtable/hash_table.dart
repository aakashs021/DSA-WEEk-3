import 'dart:math';

class Hashtable{
  int capacity;
  Hashtable({required this.capacity});
  Map<int,String> table={};
int hasfunction({required String key}){
  int hash=0;
  for(int i=0;i<key.length;i++){
    hash=hash+key.codeUnitAt(i);
  }
  return hash%capacity;
}
int hashfunctionmultiple({required String key}){
  double a=(sqrt(5)-1)/2;
  int hash=0;
  for(int i=0;i<key.length;i++){
    hash=hash+key.codeUnitAt(i);
  }
  double hashkey=(hash*a)%1;
  return (hashkey*capacity).floor();
}
insert({required String key,required String value}){
  int hashkey=hashfunctionmultiple(key: key);
  if(table.containsKey(hashkey)){
    table[hashkey]=value;
  }else{
    table[hashkey]=value;
  }
  ;
}
String lookup({required String key}){
  int hash=hasfunction(key: key);
  return table[hash]!;
}
remove({required String key}){
  int hash=hasfunction(key: key);
  if(table.containsKey(hash)){
    table.remove(hash);
  }
  ;
}
display(){
  print(table);
}
}
void main(List<String> args) {
  Hashtable tab=Hashtable(capacity: 50);
tab..insert(key: 'name', value: 'aakash')..insert(key: 'age', value: '18')..insert(key: 'name', value: 'hello')..display();
tab..insert(key: 'mane', value: 'non')..display();
}