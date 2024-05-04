class Node{
  String key;
  String val;
  Node? next;
  Node({required this.key,required this.val});
}
class Chaining{
  List<Node?> buckets=[];
  int capacity;
  int size;
  Chaining({required this.capacity}): size=0{
    buckets=List.filled(capacity, null);
  }

  int hash({required String key}){
    return key.hashCode%capacity;
  }
  insert({required String key,required String val}){
    int index=hash(key: key);
    Node? head=buckets[index];


    while(head!=null){
      if(head.key==key){
        head.val=val;
        return;
      }
        head=head.next;
    }
    size++;
    head=buckets[index];
    Node newnode=Node(key: key, val: val);
    newnode.next=head;
    buckets[index]=newnode;

  }
  remove({required String key}){
    int index=hash(key: key);
    Node? head=buckets[index];
    Node? prev=null;
    while(head!=null){
      if(head.key==key){
        break;
      }
      prev=head;
      head=head.next;
    }
    if(head==null)return;
    size--;
    if(prev!=null){
      prev.next=head.next;
    }else{
      buckets[index]=head.next;
    }
  }
  display(){
    for(int i=0;i<capacity;i++){
      if(buckets[i]!=null){
        print(i);
        Node? head=buckets[i];
        while(head!=null){
          print("${head.key} : ${head.val}");
          head=head.next;

        }
      }
    }
  }
}
void main(List<String> args) {
  Chaining a=Chaining(capacity: 2);
  a..insert(key: 'name', val: 'aakash')..insert(key: 'age', val: 'hello')..insert(key: 'he', val: 'a');
  a.display();
}