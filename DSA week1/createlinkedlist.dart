class Node{
 var  data;
 Node? next;
 Node({required this.data});
}
class Llist{
Node? head;
Node? tail;
add({required var data}){
Node newvar= Node(data: data);
if(head==null){
  head=newvar;
  tail=newvar;

}else{
  tail?.next=newvar;
  tail=newvar;
}
}
dispaly(){
  Node? temp=head;
  while(temp!=null){
    print(temp.data);
    temp=temp.next;
  }
}
}
void main(List<String> args) {
  Llist a=Llist();
  a..
  add(data: 1)..
  add(data: 1)..
  add(data: 3)..
  add(data: 1)..dispaly();


}