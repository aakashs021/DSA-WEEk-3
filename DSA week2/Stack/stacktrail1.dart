class Node{
  var data;
  Node? next;
  Node({required  this.data});
}
class Stack{
  Node? top;
  int size=0;
  push({required var data}){
    Node newnode=Node(data: data);
    newnode.next=top;
    top=newnode;
    size++;
  }
  pop(){
    top=top?.next;
  }
  display(){
    Node? temp=top;
    while(temp!=null){
      print(temp.data);
      temp=temp.next;
    }
  }
  deleteparticularelement({required var target}){
    Stack news=Stack();
    Node? temp=top;
    if(top!.data==target){
      pop();
    }else{
      do{
        news.push(data: temp?.data);
        pop();
        temp=temp?.next;
      }
      while(temp!=null&&temp.data!=target);
       if(temp?.data==target){
        pop();
       }
      while(news.top!=null){
        push(data: news.top?.data);
        news.pop();
      }
     
    }
  }
}
void main(List<String> args) {
  Stack st=Stack();
  st..push(data: 10)..push(data: 20)..push(data: 5)..push(data: 87)..deleteparticularelement(target: 20)..display();
}