
class Node{
 Node? next;
 var data;
 Node({required this.data}); 
}
class stack{
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
    size--;
  }
 bool isempty(){
if(size==0){
  return true;
}return false;
  }

  display(){
    Node? temp=top;
    while(temp!=null){
      print(temp.data);
      temp=temp.next;
    }
  }
}
deleteelemntinstack({required stack Stack,required var data}){
  stack newstack=stack();
  var newtop=Stack.top;
  if(Stack.top!.data==data){
    Stack.pop();
  }else{

    do{
    newstack.push(data: newtop);
    Stack.pop();
    }
  while(newtop!.data!=data&&newtop.next!=null);
  if(newstack.top!.data==data){
    newstack.pop();
  }
    while(newstack.top!=null){
      Stack.push(data: newtop);
      newstack.pop();
    }
  }
}
deleteElementInStack({required stack Stack, required var data}) {
  stack newStack = stack();
  bool notfound=true;
  while (!Stack.isempty()) {
    var currentData = Stack.top!.data;
    Stack.pop();
    if(notfound&&currentData==data){
      notfound=false;
    }else{
      newStack.push(data: currentData);
    }
  }

  while (!newStack.isempty()) {
    Stack.push(data: newStack.top!.data);
    newStack.pop();
  }
}


void main(List<String> args) {
  stack a=stack();
  String b = "hello";
  for(int i =0;i<b.length;i++){
    a..push(data: b[i]);
  }
  // deleteElementInStack(Stack: a, data: 'l');
 a.display();
}
