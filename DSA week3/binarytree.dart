class Node{
  int data;
  Node? left;
  Node? right;
  Node({required this.data});
}
class Binarytree{
  Node? root;
  add({required int data}){
    Node newnode=Node(data: data);
    Node? cur=root;
    if(root==null){
      root=newnode;
    }else {
      while (true) {
        if (data < cur!.data) {
          if (cur.right == null) {
            cur.right = newnode;
            break;
          }else{
            cur = cur.right;
          }
        }else{
          if (cur.left == null) {
            cur.left = newnode;
            break;
          }else{
            cur = cur.left;
          }
        }
      }
    }
    
  }
}
void main(List<String> args) {
  int a=10%7;
  print(a);
}