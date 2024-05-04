class HeapSort {
  void sort(List<int> arr) {
    int n = arr.length;

    // Build max heap
    for (int i = n ~/ 2 - 1; i >= 0; i--) {
      heapify(arr, n, i);
    }

    // Extract elements from the heap one by one
    for (int i = n - 1; i >= 0; i--) {
      // Move current root to end (swap arr[0] with arr[i])
      int temp = arr[0];
      arr[0] = arr[i];
      arr[i] = temp;

      // call max heapify on the reduced heap
      heapify(arr, i, 0);
    }
  }

  // To heapify a subtree rooted with node i which is an index in arr[]. n is size of heap
  void heapify(List<int> arr, int n, int i) {
    int largest = i; // Initialize largest as root
    int left = 2 * i + 1; // left child
    int right = 2 * i + 2; // right child

    // If left child is larger than root
    if (left < n && arr[left] > arr[largest]) {
      largest = left;
    }

    // If right child is larger than largest so far
    if (right < n && arr[right] > arr[largest]) {
      largest = right;
    }

    // If largest is not root
    if (largest != i) {
      int swap = arr[i];
      arr[i] = arr[largest];
      arr[largest] = swap;

      // Recursively heapify the affected sub-tree
      heapify(arr, n, largest);
    }
  }
}

void main() {
  List<int> arr = [8,10,1,3,5];
  HeapSort heapSort = HeapSort();
  heapSort.sort(arr);
  print('Sorted array is: $arr');
}
