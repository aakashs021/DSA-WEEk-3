import 'dart:collection';
import 'dart:math';


class Node{
  Node? left;
  Node? right;
  int data;
  Node({required this.data});
}
class Binarysearchtree{
  Node? root;
  insert({required int data}){
      root=insertrecursion(data: data, node: root);
  }
 Node insertrecursion({required int data,required Node? node}){
    Node newvar=Node(data: data);
    if(node==null){
      return newvar;
    }
    else if(data<node.data){
      node.left=insertrecursion(data: data, node: node.left);
    }else{
      node.right=insertrecursion(data: data, node: node.right);
    }return node;
    
  }
    remove(){

    }
    Node? removerecursion({required Node? node, required int data}){
      if(node==null)return node;

      if(data<node.data){
        node.left=removerecursion(node: node.left, data: data);
      }else if(data>node.data){
        node.right=removerecursion(node: node.right, data: data);
      }else{
        if(node.left==null){
          return node.right;
        }else if(node.right==null){
          return node.left;
        }
        node.data=minval(node: node.right);
        node.right=removerecursion(node: node.right, data: data);
      }
      return node;
    }
    int minval({required Node? node}){
      int min=node!.data;
        while(node?.left!=null){
          min=node!.left!.data;
          node=node.left;
        }
        return min;
    }
  search({required int data}){
    int a=searchrecusion(node: root, data: data);
    if(a==0){print('found');}
    else{print('not');}
  }

   int searchrecusion({required Node? node,required int data}){
    if(node==null)return -1;
      if(node.data==data){
        return 0;
      }else if(data<node.data){
        return searchrecusion(node: node.left, data: data);
      }else{
        return searchrecusion(node: node.right, data: data);
      }
    }


  levelorder({required Node? node}){
    Queue q=Queue();
    q.add(node);
    while(q.isNotEmpty){
      Node? val=q.removeFirst();
      print(val?.data);
      if(val?.left!=null){
      q.add(val?.left);

      }if(val?.right!=null){
        q.add(val?.right);
      }

    }
  }

  display(){
    levelorder(node: root);
  }
  inorder({required Node? node}){
    if(node!=null){
    inorder(node: node.left);
    print(node.data);
    inorder(node: node.right);
    }
  }
  Node? findnode({required Node? node,required int data}){
    if(node==null)return null;
    if(node.data==data)return root;
    else if(data<node.data){
      return findnode(node: node.left, data: data);
    }else{
      return findnode(node: node.right, data: data);
    }
  }
  height({required int data}){
    Node? node=findnode(node: root, data: data);
  print(heightrecursion(node: node));
  }
  int heightrecursion({required Node? node}){
    if(node==null)return -1;
    int leftheight=heightrecursion(node: node.left);
    int rightheight=heightrecursion(node: node.right);
    return max(leftheight, rightheight)+1;
  }
  depth({required int data}){
    print(depthrecursion(node: root, data: data,f: true));
  }
  int depthrecursion({required Node? node,required int data,bool f=false}){
    int dep=-1;
    if(f){
      if(findnode(node: root, data: data)==null)return -1;
    }
   if(node==null)return dep;
   if(data==node.data)return dep+1;
   if(data<node.data){
    dep=depthrecursion(node: node.left, data: data);
   }else{
    dep=depthrecursion(node: node.right, data: data);
   }return dep+1;
  }
  size(){
print(sizerecursion(node: root));
  }
  int sizerecursion({required Node?node}){
    
    if(node==null)return 0;
    return 1+sizerecursion(node: node.left)+sizerecursion(node: node.right);
  }
  nearestvalue({required int data}){
    print(nearestvaluerecursion(data: data));
  }
  int? nearestvaluerecursion({ required int data}){
    if(root!=null){

    Node? cur=root;
    int close=root!.data;
    while(cur!=null){
      if((data-close).abs()>(data-cur.data).abs()){
        close=cur.data;
      }
      if(data<cur.data)cur=cur.left;
      else if(data>cur.data)cur=cur.right;
      else break;
    }
    return close;
    }
    return null;

  }
  validata(){
    print(validaterecursion(node: root));
  }

  validaterecursion({required Node? node,int? min,int? max}){
    if(node==null)return true;
    if(min!=null&&node.data<=min)return false;
    if(max!=null&&node.data>=max)return false;

    return validaterecursion(node: node.left,min: min,max: node.data)&&validaterecursion(node: node.right,min: node.data);
  }
}
void main(List<String> args) {
  Binarysearchtree bt=Binarysearchtree();
 bt..insert(data: 10)..insert(data: 5)
  ..insert(data: 15)
  ..insert(data: 18)
  ..insert(data: 14)
  ..insert(data: 17)
  ..insert(data: 19)
  ..insert(data: 4)
  ..insert(data: 8)
  ..insert(data: 2)
  ..insert(data: 3)..insert(data: 1)..insert(data: 0)
  ..insert(data: 9)..validata();}