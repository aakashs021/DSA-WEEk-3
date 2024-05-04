void bubbleSort(List<int> arr) {
  int n = arr.length;
  bool swapped; // Track if any elements were swapped in a pass

  // Iterate over the array until no swaps are made or until the end of the array
  for (int k = 0; k < n - 1; k++) {
    print(k+1);
    swapped = false; // Reset swapped flag for each pass
    for (int i = 0; i < n - 1 - k; i++) {
      if (arr[i] > arr[i + 1]) {
        // Swap arr[i] and arr[i+1]
        int temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        swapped = true; // Set swapped flag if any swap occurs
      }
    }
    if (!swapped) break; // Exit loop if no swaps were made
  }
}

void main() {
  List<int> arr = [8, 2, 3, 4, 5]; // Already sorted array
  print("Original array: $arr");
  bubbleSort(arr);
  print("Sorted array: $arr");
}
