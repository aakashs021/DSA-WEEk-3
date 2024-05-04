class Node{
  Node? next;
  Node? prev;
  int data;
  Node({required this.data});
}
class Doublelinkedlist{
  Node? head;
  Node? tail;
  add({required int data}){
    Node newvar=Node(data: data);
    if(head==null){
      head=newvar;
      tail=newvar;
    }else{
      newvar.prev=tail;
      tail!.next=newvar;
      tail=newvar;
    }
  }
  display(){
    Node? temp=head;
    while (temp!=null) {
        print(temp.data);
        temp=temp.next;
    }

  }
  insertbefore({required int data, required int target}){
    Node newnode=Node(data: target);
    if(head==null){
      head=newnode;
    }else{
    Node? temp=head;
      while(temp!=null&&temp.data!=target){
        temp=temp.next;
      }
      if(temp==null){
        return;
      }
      if(temp==head){
      newnode.prev=temp.prev;
      temp.prev=newnode;
      newnode.next=temp;
      }else{
        newnode.prev=temp.prev;
        temp.prev!.next=newnode;
        temp.prev=newnode;
        newnode.next=temp;
      }
      
    }

  }

}
void main(List<String> args) {
  Doublelinkedlist a=Doublelinkedlist();
  a..add(data: 10)..add(data: 20)..add(data: 50)..insertbefore(data: 20, target: 0)..display();
}