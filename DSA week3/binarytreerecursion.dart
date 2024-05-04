class Node{
  int data;
  Node? left;
  Node? right;
  Node({required this.data});
}
class Binarysearch{
  Node? root;
  inser({required int data}){
    root=insertrecursion(data: data, node: root);
  }

 Node? insertrecursion({required int data,required Node? node}){
    Node newvar=Node(data: data);
    Node? temp=node;
    if(temp==null){
      return newvar;
      // temp=newvar;
    }else if(temp.left==null){
        temp.left=newvar;
    }else if(temp.right==null){
      temp.right=newvar;
    }else{
      if(temp.left!.left==null||temp.left?.right==null){
      node?.left=insertrecursion(data: data, node: node);

      }else{
        node?.right=insertrecursion(data: data, node: node);
      }
    }

    return node;
  }
}