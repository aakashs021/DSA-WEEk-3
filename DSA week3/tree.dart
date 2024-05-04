class TreeNode<T> {
  T data;
  List<TreeNode<T>> children;

  // Constructor to initialize the node with data. Children are optional and default to empty.
  TreeNode(this.data, [List<TreeNode<T>>? children])
      : children = children ?? [];

  // Method to add a child node
  void addChild(TreeNode<T> child) {
    children.add(child);
  }

  // Method to print the tree starting from this node in a pretty format
  void printTree([String prefix = '', bool isLast = true]) {
    print('$prefix${isLast ? '└─' : '├─'} $data');
    for (int i = 0; i < children.length; i++) {
      children[i].printTree('$prefix${isLast ? '  ' : '│ '}', i == children.length - 1);
    }
  }
}
void main(List<String> args) {
  TreeNode tree=TreeNode(30);
  tree..addChild(TreeNode(45))..addChild(TreeNode(20));
  tree.printTree();
}
