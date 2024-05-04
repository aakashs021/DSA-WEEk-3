import 'dart:collection';
import 'dart:math';

class Node{
  int data;
  Node? left;
  Node? right;
  Node({required this.data});
}

class Binarysearchrecusion{
  Node? root;

  insert({required int data}){
root=insertrecursion(node: root, data: data);
  }

  Node? insertrecursion({required Node? node,required int data}){

    if(node==null){
      return Node(data: data);
    }else if(data<node.data){
      node.left=insertrecursion(node: node.left, data: data);
    }else{
      node.right=insertrecursion(node: node.right, data: data);
    }
    return node;
  }
  display(){
inorderdisplay(node: root);
  }
  posoreder({required Node? node}){
if(node!=null){

    inorderdisplay(node: node.left);
    inorderdisplay(node: node.right);
    print(node.data);
    }
  }
  inorderdisplay({required Node? node}){
    if(node!=null){

    inorderdisplay(node: node.left);
    print(node.data);
    inorderdisplay(node: node.right);
    }
  } preorder({required Node? node}){
    if(node!=null){
    print(node.data);
    preorder(node: node.left);
    preorder(node: node.right);
    }

  }
  sum(){
    print(sumofoddnumber(node: root, level: 0));
  }
  int sumofoddnumber({required Node? node,required int level}){
    if(node==null)return 0;
    int sum=level%2!=0?node.data:0;
    sum=sum+sumofoddnumber(node: node.left, level: level+1)+sumofoddnumber(node: node.right, level: level+1);
    return sum;
  }
  remove({required int data}){
    root=removerecursion(node: root, data: data);
  }
 Node? removerecursion({required Node? node, required int data}){
    if(node==null){
      return node;
    }
    if(data<node.data){
      node.left=removerecursion(node: node.left, data: data);
    }else if(data>node.data){
      node.right=removerecursion(node: node.right, data: data);
    }else{
      if(node.left==null){
        return node.right;
      }else if(node.right==null){
        return node.right;
      }
      node.data=minval(node: node.right);
        node.right=removerecursion(node: node.right, data: node.data);
    }
    return node;
  }
  int minval({required Node? node}){
    int mv=node!.data;
    while(node!.left!=null){
      mv=node.left!.data;
      node=node.left;
    }
    return mv;
  }
search({required int data}){
  int a=searchrecusion(node: root, data: data);
  if(a==1){
    print('found');
  }else{
    print('not');
  }
}

 int searchrecusion({required Node? node,required int data}){
    if(node!=null){
      if(node.data==data){
        return 1;
      }else if(data<node.data){
        return searchrecusion(node: node.left,data: data);
      }else {
        return searchrecusion(node: node.right, data: data);
      }
    }
    return -1;
  }
  bfstraversal(){
    Queue q=Queue();
    q.add(root);
    while(q.isNotEmpty){
    Node temp=q.removeFirst();
    print(temp.data);

    if(temp.left!=null){
      q.add(temp.left);
    }
    if(temp.right!=null){
      q.add(temp.right);
    }

    }


  }
  Node? findnode({required Node? node,required int data}){
    Node? temp=node;
    if(temp?.data==data){
      return temp;
    }else if(temp!=null&&data<temp.data){
      return findnode(node: temp.left, data: data);
    }else if(temp!=null&&data>temp.data){
      return findnode(node: temp.right, data: data);
    }return temp;
  }

  height({required int data}){
    Node? temp=findnode(node: root, data: data);
    print(findheight(node: temp));
  }

  int findheight({required Node? node}){
    if(node==null){
      return -1;
    }
    int leftheight=findheight(node: node.left);
    int rightheight=findheight(node: node.right);
    return max(leftheight, rightheight)+1;
  }
  depth({required int data}){
    print(finddepth(node: root, data: data));
  }
  int finddepth({required Node? node, required int data}){
    int dep=-1;
    if(node==null)return dep;
   if(node.data==data){
    return dep+ 1;
   }else if(data<node.data){
      dep=finddepth(node: node.left, data: data);
   }else{
    dep=finddepth(node: node.right, data: data);
   }
   return dep+1;
  }
    size(){
      print(findsize(node: root));
    }

  int findsize({required Node? node}){
    if(node==null){
      return 0;
    }
    return 1+findsize(node: node.left)+findsize(node: node.right);
  }
 int closestvalue({required int data}){
    if(root==null){
      return -1;
    }
    Node? temp=root;
    int close=temp!.data;
    while(temp!=null){
      if((data-close).abs()>(data-temp.data).abs()){
        close=temp.data;
      }
      if(data<temp.data){
        temp=temp.left;
      }else if(data>temp.data){
        temp=temp.right;
      }else{
        break;
      }
    }
      return close;
  }
  bstornot(){
    print(isbst(node: root));
  }

  bool isbst({required Node? node,int? minn, int? maxx}){
    if(node==null)return true;

    if(minn!=null&&node.data<=minn)return false;
    if(maxx!=null&&node.data>=maxx)return false;

  return isbst(node: node.left,minn: minn,maxx: node.data)&&isbst(node: node.right,minn: node.data,maxx: maxx);
  }

}
void main(List<String> args) {
  Binarysearchrecusion bt=Binarysearchrecusion();
  bt..insert(data: 10)..insert(data: 5)
  ..insert(data: 15)
  ..insert(data: 18)
  ..insert(data: 14)
  ..insert(data: 17)
  ..insert(data: 19)
  ..insert(data: 4)
  ..insert(data: 8)
  ..insert(data: 2)
  ..insert(data: 3)
  ..insert(data: 9)..sum();
  
 
}