class Node{
  int data;
  Node? left;
  Node? rigth;
  Node({required this.data});
}

class BinarySearchTree {
  Node? root;

  void insert({required int data}) {
    root = insertRecursion(data: data, node: root);
  }

  Node? insertRecursion({required int data, required Node? node}) {
    if (node == null) {
      return Node(data: data);
    }
    if (data < node.data) {
      node.left = insertRecursion(data: data, node: node.left);
    } else {
      node.rigth = insertRecursion(data: data, node: node.rigth);
    }
    return node;
  }

  void remove(int data) {
    root = removeRecursion(root, data);
  }

  Node? removeRecursion(Node? node, int data) {
    if (node == null) return node;

    if (data < node.data) {
      node.left = removeRecursion(node.left, data);
    } else if (data > node.data) {
      node.rigth = removeRecursion(node.rigth, data);
    } else {
      // Node with only one child or no child
      if (node.left == null) {
        return node.rigth;
      } else if (node.rigth == null) {
        return node.left;
      }

      // Node with two children: Get the inorder successor (smallest in the right subtree)
      node.data = minValue(node.rigth);

      // Delete the inorder successor
      node.rigth = removeRecursion(node.rigth, node.data);
    }
    return node;
  }

  int minValue(Node? node) {
    int minv = node!.data;
    while (node?.left != null) {
      minv = node!.left!.data;
      node = node.left;
    }
    return minv;
  }

  void displayInOrder() {
    inOrder(node: root);
  }

  void inOrder({required Node? node}) {
    if (node != null) {
      inOrder(node: node.left);
      print(node.data);
      inOrder(node: node.rigth);
    }
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(data: 50);
  bst.insert(data: 30);
  bst.insert(data: 70);
  bst.insert(data: 22);
  bst.insert(data: 35);
  bst.insert(data: 60);
  bst.insert(data: 80);
  bst.displayInOrder();
  print("Removing 70");
  bst.remove(1);
  // bst.remove(30);
  bst.displayInOrder();
}
