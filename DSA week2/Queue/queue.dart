class Node{
  Node? next;
  var data;
  Node({required this.data});
}
class Queue{
  Node? front;
  Node? rear;
  int size=0;
  enqueue({required var data}){
    Node newnode=Node(data: data);
    if(front==null){
      front=newnode;
      rear=newnode;
      size++;
    }
    else{
      rear!.next=newnode;
      rear=newnode;
      size++;
    }
  }
  dequeue(){
    if(front!=null){
      front=front!.next;
      size--;
    }
  }
  peek(){
    if(front!=null){
    print(front!.data);

    }
  }
  bool isEmpty(){
    if(size==0){
return true;
    }
    return false;
  }
  display(){
    Node? temp=front;
    while(temp!=null){
      print(temp.data);
      temp=temp.next;
    }
  }
}
void main(List<String> args) {
  Queue qu=Queue();
  qu..enqueue(data: 10)..enqueue(data: 20)..enqueue(data: 40)..enqueue(data: 50)..dequeue()..display()..peek();
}
