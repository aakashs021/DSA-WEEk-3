import 'dart:collection';
import 'dart:math';


class Node{
  Node? left;
  Node? right;
  int val;
  Node({required this.val});
}
class Traversal{
  inordertraversal({required Node? node}){
    if(node!=null){
    inordertraversal(node: node.left);
    print(node.val);
    inordertraversal(node: node.right);
    }
  }
  preorder({required Node? node}){
    if(node!=null){
      print(node.val);
      preorder(node: node.left);
      preorder(node: node.right);
    }
  }
   postoreder({required Node? node}){
    if(node!=null){
      postoreder(node: node.left);
      postoreder(node: node.right);
      print(node.val);
    }
  }
  Queue q=Queue();
  levelorder({required Node? node}){
    q.add(node);

    while(q.isNotEmpty){
      Node c=q.removeFirst();
      print(c.val);
      if(c.left!=null){
        q.add(c.left);
      }
      if(c.right!=null){
        q.add(c.right);
      }

    }
  }
}
class BinarySearchTree{
  Node? root;
  insert({required int val}){
    root=insertrecursion(node: root, val: val);
  }

 Node? insertrecursion({required Node? node,required int val}){
    Node newnode=Node(val: val);
    if(node==null)return newnode;
    if(val<node.val){
      node.left=insertrecursion(node: node.left, val: val);
    }else{
      node.right=insertrecursion(node: node.right, val: val);
    }
    return node;
  }
  remove({required int val}){
    root=removeRecursion(node: root, val: val);
  }

 Node? removeRecursion({required Node? node, required int val}){
    if(node==null)return node;
    if(val<node.val){
      node.left=removeRecursion(node: node.left, val: val);
    }else if(val>node.val){
      node.right=removeRecursion(node: node.right, val: val);
    }else{
      if(node.left==null){
        return node.right;
      }
      if(node.right==null){
        return node.left;
      }
      node.val=minval(node: node.right!);
      node.right=removeRecursion(node: node.right, val: node.val);

    }
    return node;
  }
  int minval({required Node node}){
    int min=node.val;
    Node? newnode=node;
    if(newnode.left!=null){
      min=newnode.val;
      newnode=newnode.left;
    }
    return min;
  }
  display(){
    Traversal p=Traversal();
    p.levelorder(node: root);
  }
  isbstornot(){
    print(validate(node: root));
  }
 bool validate({required Node? node,int? min,int? max}){
    if(node==null)return true;
    if(min!=null&&min>node.val)return false;
    if(max!=null&&max<node.val)return false;

      return (validate(node: node.left,max: node.val)&&validate(node: node.right,min: node.val));
  }
nearest({required int val}){
  print("Nearest value is ${nearestvalue(val: val)}");
}
int?  nearestvalue({required int val}){
    if(root!=null){
    Node? cur=root;
    int closest=cur!.val;
    while(cur!=null){

    if((val-closest).abs()>(val-cur.val).abs()){
      closest=cur.val;
    }
    if(val<cur.val){
      cur=cur.left;
    }else if(val>cur.val){
      cur=cur.right;
    }else{
     break; 
      }
    }

    return closest;
    }
    return null;
  }
 Node? findnoderecursion({required Node? node,required int val}){
    if(node==null)return node;
    if(node.val==val)return node;
    else if(val<node.val)return findnoderecursion(node: node.left, val: val);
    else {
      return findnoderecursion(node: node.right, val: val);
    }
  }
 Node? findnode({required int val}){
  // if(findnoderecursion(node: root, val: val)?.val!=null){
  //   print('found');
  // }else{
  //   print('no');
  // }
    return findnoderecursion(node: root, val: val);
  }
 int findheightrecursion({required Node? node}){
   if(node==null)return -1;
    
    
    return max(findheightrecursion(node: node.left), findheightrecursion(node: node.right))+1;


  }
  findheight({required int val}){
    print(findheightrecursion(node: findnode(val: val)));
  }
  finddepthrecursion({required Node? node,required Node? n}){
    if(node==null)return -1;
    if(node==n)return 0;
    else if(n!.val<node.val)return finddepthrecursion(node: node.left, n: n)+1;
    else return finddepthrecursion(node: node.right, n: n)+1;
  }
  finddepth({required int val}){
    Node? n=findnode(val: val);
    if(n!=null){

    print(finddepthrecursion(node: root, n: n));
    }
  }

  findsize(){
    print(findsizerecursion(node: root));
  }

 int findsizerecursion({required Node? node}){
    if(node==null)return 0;
    return 1+findsizerecursion(node: node.left)+findsizerecursion(node: node.right);
  }

  
}
void main(List<String> args) {
  BinarySearchTree b=BinarySearchTree();
  b..insert(val: 10)
  ..insert(val: 50)
  ..insert(val: 0)
  ..insert(val: 89)
  ..insert(val: 11);
  b.findsize();
  // b.finddepth(val: 0);
  // b.isbstornot();
  // b.display();
  // b.nearest(val: 52);
}