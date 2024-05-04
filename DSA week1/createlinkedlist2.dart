
class Node {
  Node? next;
  int data;
  Node({required this.data});
}

class LinkedList {
  Node? head;
  Node? tail;
  

  add({required var data}) {
    Node newVariable = Node(data: data);
    if (head != null && tail!=null) {
      tail?.next = newVariable;
      tail = newVariable;
    } else {
      head = newVariable;
      tail = newVariable;
    }
  }
  display(){
    Node? temp=head;
    while(temp!=null){
      print(temp.data);
      temp=temp.next;
    }
  }
  deleteelement({required int value}){
    Node? temp=head;
    Node? previous;
    if(head?.data==value){
      head=temp!.next;
    }else{

    while(temp!=null&&temp.data!=value){
     previous=temp;
     temp=temp.next;
    }
    if(temp!=null){
      previous?.next=temp.next;
    }
    }
  }

  deleteindex({required int index}){
    Node? temp=head;
    Node? prev;
    int i=0;
    if(temp!=null){
      if(index==0){
        head=head!.next;
      }else{
        
        while(temp!=null&&i!=index){
          prev=temp;
          temp=temp.next;
          i++;
        }
        if(i==index){
          prev!.next=temp!.next;
        }
      }
    }
  }
  insertbefore({required int number,required int addednumber}){
    Node? temp=head;
    Node? prev=head?.next;
        Node newvar=Node(data: addednumber);
    if(temp?.data==number){
      head?.next=newvar;
      newvar.next=prev;
    }else{

    while(temp!=null){
      if(number==temp.data){
        prev!.next=newvar;
        newvar.next=temp;
        break;
      }else{
      prev=temp;
      temp=temp.next;

      }
    }
    }
  }
  insertafter({required int number,required int addednumber}){
    Node? temp=head;
    Node? newvar=Node(data: addednumber);
    if(head?.data==number){
      newvar.next=temp!.next;
      head!.next=newvar;
      
    }else{
      while(temp!.data!=number){
          temp=temp.next;
      }
      if(temp.data==number){
        if(temp.next!=null){
          newvar.next=temp.next;
        }
        temp.next=newvar;
      }
    }
  }
  reverselinkedlist(){
Node? cur=head;
Node? pre;
Node? nex;
while(cur!=null){
  nex=cur.next;
  cur.next=pre;
  pre=cur;
  cur=nex;
}
head=pre;


  }
  addnodeatbegin({required int number}){
    // Node? temp=head;
    Node? newvar=Node(data: number);
    if(head!=null){
      newvar.next=head;
      head=newvar;

    }
  }
  addnodetoend({required int number}){
    Node? newvar=Node(data: number);
    Node? temp=tail;
    temp!.next=newvar;
    tail=newvar;
  }
  removeduplicatesinsortedarray(){
   Node? cur=head;
   while(cur!=null){
    Node? nex=cur.next;
    while (nex!=null&&nex.data==cur.data) {
      nex=nex.next;
    }
    cur.next=nex;
    if(nex==tail){
      tail=cur;
    }
    cur=cur.next;
   }
  }
  addlist({required List<int> arr}){
    for(int i=0;i<arr.length;i++){
      Node newvar=Node(data: arr[i]);
      if(head==null){
        head=newvar;
        tail=newvar;
      }else{
        tail!.next=newvar;
        tail=newvar;
      }
    }
  }
  removenthnode({required int n}){
    if(n==1){
      
    }
  }
}
void main(List<String> args) {
  

  LinkedList a=LinkedList();
  a..addlist(arr: [1,2,2,3,3,3,4])..removeduplicatesinsortedarray() ..display();
  // a..add(data: 10)..add(data: 11)..add(data: 20)..add(data: 40)..add(data: 45) ..display();
  // // print('-----');
  // // a..reverselinkedlist()..display();
  // // print('---------');
  // // a..addnodeatbegin(number: 31)..display();
  // print('---------');
  // a..addnodetoend(number: 31)..display();
  // ;
  
}