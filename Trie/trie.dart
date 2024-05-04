class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;

  // TrieNode();
}

class Trie {
  TrieNode root=TrieNode();

  // Trie() : root = TrieNode();

  // Insert a word into the trie
  void insert(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String c = word[i];
      if (!node.children.containsKey(c)) {
        node.children[c] = TrieNode();
      }
      node = node.children[c]!;
    }
    node.isEndOfWord = true;
  }

  // Search for a word in the trie
  bool search(String word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
      String c = word[i];
      if (!node.children.containsKey(c)) {
        return false;
      }
      node = node.children[c]!;
    }
    return node.isEndOfWord;
  }
 
}

void main() {
  Trie trie = Trie();
  // trie.insert("hello");
  trie.insert("hellohi");
  // trie.insert("world");
  // trie.display();
  // print(trie.root.isEndOfWord);
  
  print(trie.search("hello")); // true
  // print(trie.search("world")); // true
  // print(trie.search("help")); // false
}
