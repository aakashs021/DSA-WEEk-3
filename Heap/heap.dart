class MinHeap {
  List<int> _heap = [];

  void insert(int value) {
    _heap.add(value);
    _bubbleUp(_heap.length - 1);
  }

  int remove() {
    if (_heap.isEmpty) {
      throw Exception('Heap is empty');
    }
    int result = _heap.first;
    _heap[0] = _heap.last;
    _heap.removeLast();
    _bubbleDown(0);
    return result;
  }

  void _bubbleUp(int index) {
    while (index > 0) {
      int parent = (index - 1) >> 1;
      if (_heap[parent] > _heap[index]) {
        _swap(parent, index);
        index = parent;
      } else {
        break;
      }
    }
  }

  void _bubbleDown(int index) {
    int leftChild = (index * 2) + 1;
    int rightChild = (index * 2) + 2;
    int smallest = index;

    if (leftChild < _heap.length && _heap[leftChild] < _heap[smallest]) {
      smallest = leftChild;
    }
    if (rightChild < _heap.length && _heap[rightChild] < _heap[smallest]) {
      smallest = rightChild;
    }
    if (smallest != index) {
      _swap(smallest, index);
      _bubbleDown(smallest);
    }
  }

  void _swap(int i, int j) {
    int temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }
 

  @override
  String toString() {
    return _heap.toString();
  }
}

void main() {
  var heap = MinHeap();
  heap.insert(8);
  heap.insert(10);
  heap.insert(15);
  heap.insert(20);
  heap.insert(17);
  heap.insert(4);

  print(heap);  // Print heap after insertions

  print(heap.remove());  // Remove and print the root element
  print(heap);  // Print heap after removal
}
