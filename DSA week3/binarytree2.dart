
class Node {
  Node? left;
  Node? right;
  int data;

  Node({required this.data});
}

class Binarytree {
  Node? root;

  void add({required int data}) {
    Node newnode = Node(data: data);
    if (root == null) {
      root = newnode;
    } else {
      Node? cur = root;
      while (true) {
        if (data < cur!.data) {
          if (cur.left == null) {
            cur.left = newnode;
            break;
          } else {
            cur = cur.left;
          }
        } else {
          if (cur.right == null) {
            cur.right = newnode;
            break;
          } else {
            cur = cur.right;
          }
        }
      }
    }
  }

  // Display Tree In-Order
  void displayInOrder() {
    _displayInOrder(root);
    print(""); // For new line after printing all nodes
  }

  void _displayInOrder(Node? node) {
    if (node != null) {
      _displayInOrder(node.left);
      print("${node.data} ");
      _displayInOrder(node.right);
    }
  }

  // Display Tree Pre-Order
  void displayPreOrder() {
    _displayPreOrder(root);
    print(""); // For new line after printing all nodes
  }

  void _displayPreOrder(Node? node) {
    if (node != null) {
      print("${node.data} ");
      _displayPreOrder(node.left);
      _displayPreOrder(node.right);
    }
  }

  // Display Tree Post-Order
  void displayPostOrder() {
    _displayPostOrder(root);
    print(""); // For new line after printing all nodes
  }

  void _displayPostOrder(Node? node) {
    if (node != null) {
      _displayPostOrder(node.left);
      _displayPostOrder(node.right);
      print("${node.data} ");
    }
  }
}
void main(List<String> args) {
  Binarytree bt=Binarytree();
  bt..add(data: 20)..add(data: 1)..add(data: 30)..add(data: 18)..add(data: 35)..add(data: 22)..add(data: 12)..displayInOrder();
}