class Treinode{
  Map<String,Treinode> children={};
 bool isend=false;
}

class Trie{
Treinode root=Treinode();

insert({required String word}){
  Treinode node=root;
  for(int i=0;i<word.length;i++){
    String c=word[i];
    if(!node.children.containsKey(c)){
      node.children[c]=Treinode();
    }
    node=node.children[c]!;
  }
  node.isend=true; 
}
bool search({required String word}){
  Treinode node=root;
  for(int i=0;i<word.length;i++){
    String c=word[i];
    if(!node.children.containsKey(c)){
      return false;
    }
    node=node.children[c]!;
  }
  return node.isend;
}
}
void main(List<String> args) {
  Trie t=Trie();
  t.insert(word: 'aakash');
  print(t.search(word: 'aakas'));
  print(t.root.isend);
}