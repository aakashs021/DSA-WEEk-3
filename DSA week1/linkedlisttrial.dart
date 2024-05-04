class Node{
  Node? next;
  int data;
  Node({required this.data});
}
class LinkedList{
  Node? head;
  Node? tail;
  add({required int data}){
    Node newnode=Node(data: data);
    if(head==null){
      head=newnode;
      tail=newnode;
    }else{
      tail!.next=newnode;
      tail=newnode;
    }
  }
  display(){
    Node? temp=head;
    while(temp!=null){
      print(temp.data);
      temp=temp.next;
    }
  }
  addlist({required List<int> arr}){
    
    for(int data in arr){
      Node newnode=Node(data: data);
      if(head==null){
        head=newnode;
        tail=newnode;
      }else{
        tail!.next=newnode;
        tail=newnode;
      }
    }
  }
  addatbeggining({required int data}){
    if(head!=null){
      Node? temp=head;
      Node newnode=Node(data: data);
      newnode.next=temp!.next;
      head=newnode;
    }
  }
  addatend({required int data}){
    if(head!=null){
      Node newnode=Node(data: data);
      tail!.next=newnode;
      tail=newnode;
    }
  }
  deleteelement({required int data}){
    if(head!=null){
      Node? temp=head;
      Node? prev;
      while(temp!.data!=data){
        prev=temp;
        temp=temp.next;
      }
      if(temp.data==data){
        prev!.next=temp.next;
      }
    }
  }
  deleteelemtindex({required int n}){
    if(head!=null){

    }
  }
  reverselinkedlist(){
    if(head!=null){
      Node? cur=head;
      Node? nex;
      Node? pre;
      while(cur!=null){
        nex=cur.next;
        cur.next=pre;
        pre=cur;
        cur=nex;
      }
      head=pre;
    }
  }
  midelemnt(){
    Node? fast=head;
    Node? slow=head;
    while(fast!=null&&fast.next!=null){
      slow=slow!.next;
      fast=fast.next!.next;
    }
    print('Middle elemnt is ${slow!.data}');
  }

}
void main(List<String> args) {
  LinkedList a=LinkedList();
  a..add(data: 10)..add(data: 20)
  ..add(data: 30)..addlist(arr: [1,2,45,65,52])
  ..addatbeggining(data: 77)
  ..addatend(data: 1000)..addatbeggining(data: 23)
  ..display()
  ..midelemnt();
}