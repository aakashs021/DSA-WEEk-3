import 'dart:math';

class linearprobinghashtable{
  List<String?> keys=[];
  
  List<String?> value=[];
  int capacity;
  int size=0;
  
  linearprobinghashtable({required this.capacity}){
   keys=List.filled(capacity, null);
   value=List.filled(capacity, null);
  }
  int multiplehashfunction({required String key}){
    final double A=(sqrt(5)-1)/2;
    int hash=0;
    for (var i = 0; i < key.length; i++) {
        hash+=key.codeUnitAt(i);
    }
    double hashcode=(hash*A)%1;
    return (hashcode*capacity).floor();
  }
  insert({required String key,required String val}){
    if(size>=capacity){
      print('size is full');
      return;
    }
    int index=multiplehashfunction(key: key);

    while(keys[index]!=null&&keys[index]!=key){
      index=(index+1)%capacity;
    }
    if(keys[index]!=key){
size++;
    }
    keys[index]=key;
    value[index]=val;
  }
   String lookup({required String key}){
    int index=multiplehashfunction(key: key);
    while(keys[index]!=null){
      if(keys[index]==key){
        return value[index]!;
      }
      index=index+1%capacity;
    }
    return 'No data found';
   }

  remove({required String key}){
    int index=multiplehashfunction(key: key);
    int start=index;
    while(keys[index]!=null&&keys[index]!=key){
      index=(index+1)%capacity;
      if(start==index){
        print('Key not found');
        return;
      }
    }
    if(keys[index]==key){
      keys[index]=null;
      value[index]=null;
      size--;

      index=(index+1)%capacity;
      while(keys[index]!=null){
        String rehashkey=keys[index]!;
        String rehashval=value[index]!;
        keys[index]=null;
        value[index]=null;
        size--;
        insert(key: rehashkey, val: rehashval);
        index=(index+1)%capacity;
      }
    }
  }

  display(){
    print('Hashtable');
   for(int i=0;i<capacity;i++){
    if(keys[i]!=null){
      print("$i> ${keys[i]} : ${value[i]}");
    }
   }
  }
  
}
void main(List<String> args) {
  linearprobinghashtable a=linearprobinghashtable(capacity: 2);
  a..insert(key: 'name', val: 'aakash')..insert(key: 'name', val: 'hello')..remove(key: 'he');
  a.display();
}