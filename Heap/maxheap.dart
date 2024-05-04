class MaxHeap {
  List<int> _heap = [];

  int get size => _heap.length;
  bool get isEmpty => _heap.isEmpty;

  void add(int value) {
    _heap.add(value);
    _bubbleUp(_heap.length - 1);
  }

  int peek() {
    if (isEmpty) throw Exception("Heap is empty");
    return _heap.first;
  }

  int remove() {
    if (isEmpty) throw Exception("Heap is empty");
    int result = _heap.first;
    _heap.first = _heap.last;
    _heap.removeLast();
    if (_heap.isNotEmpty) {
      _bubbleDown(0);
    }
    return result;
  }

  void _bubbleUp(int index) {
    while (index != 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (_heap[index] <= _heap[parentIndex]) break;
      _swap(parentIndex, index);
      index = parentIndex;
    }
  }

  void _bubbleDown(int index) {
    int lastIndex = _heap.length - 1;
    
      int leftChildIndex = 2 * index + 1;
      int rightChildIndex = 2 * index + 2;
      int largest = index;

      if (leftChildIndex <= lastIndex && _heap[leftChildIndex] > _heap[largest]) {
        largest = leftChildIndex;
      }
      if (rightChildIndex <= lastIndex && _heap[rightChildIndex] > _heap[largest]) {
        largest = rightChildIndex;
      }

      if (largest != index) 
      {

        
      _swap(index, largest);
     
      _bubbleDown(largest);
      }
    
  }

  void _swap(int i, int j) {
    int temp = _heap[i];
    _heap[i] = _heap[j];
    _heap[j] = temp;
  }
}

void main() {
  var heap = MaxHeap();
  heap.add(10);
  heap.add(15);
  heap.add(20);
  heap.add(17);
  heap.add(8);

  print("Max heap array: ${heap._heap}");

  while (!heap.isEmpty) {
    print("Removed: ${heap.remove()}");
  }
}
