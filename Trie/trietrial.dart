class Trienode{
  Map<String, Trienode> children={};
  bool isend=false;
}
class Trie{
  Trienode root=Trienode();
  insert({required String word}){
    Trienode node=root;
    for(int i=0;i<word.length;i++){
      String c=word[i];
      if(!node.children.containsKey(c)){
        node.children[c]=Trienode();
      }
      node=node.children[c]!;
    }
    node.isend=true;
  }
 bool search({required String word}){
    Trienode node=root;
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
  Trie a=Trie();
  a..insert(word: 'aakash')..insert(word: 'hello');
  print(a.search(word: 'aakash'));
}