// class Node{
//   String data;
//   Node? next;
//   Node({required this.data});
// }
// class Stack{
//   Node? top;
//   int size=0;

//   push({required String data}){
//     Node newnode=Node(data: data);
//     newnode.next=top;
//     top=newnode;
//     size++;
//   }
//   pop(){
//     if(size>0){

//     top=top?.next;
//     size--;
//     }
//   }
//   deletespecificelement({required int data}){
//     Stack newStack=Stack();
//     Node? temp=top;

//     if(top!.data==data){
//       pop();
//     }else{
//       while(temp!=null&&temp.data!=data){
//         newStack.push(data: temp.data);
//         pop();
//       }
//     }
//   }
// //  bool parantesismatching({required String exp}){
// //   Map<String, String> ma={
// //     '}':'{',
// //     ')':'(',
// //     ']':'['
// //   };
// //     for(int i=0;i<exp.length;i++){
     
// //     }
    
// //   }

// }
// void main(List<String> args) {
//   Stack st=Stack();
//   // print(st.parantesismatching(exp: '((aaka))'));
//   List<int> ar=[1,2,3];
//   // ar.removeLast();
// //   print(ar.removeLast());
// // print(ar);
// int a=10;
// int b=20;
// // int c=ab+;
// }