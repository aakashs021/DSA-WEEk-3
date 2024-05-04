
class CuckooHashTable<K, V> {
  List<K?> keys1;
  List<V?> values1;
  List<K?> keys2;
  List<V?> values2;
  final int capacity;
  static const int MAX_LOOP = 16;

  CuckooHashTable(this.capacity)
      : keys1 = List<K?>.filled(capacity, null),
        values1 = List<V?>.filled(capacity, null),
        keys2 = List<K?>.filled(capacity, null),
        values2 = List<V?>.filled(capacity, null);

  int _hash1(K key) {
    return key.hashCode % capacity;
  }

  int _hash2(K key) {
    return (key.hashCode * 31) % capacity;
  }

  void insert(K key, V value) {
    int pos1 = _hash1(key);
    int pos2 = _hash2(key);

    // Check if key already exists, update the value
    if (keys1[pos1] == key) {
      values1[pos1] = value;
      return;
    }
    if (keys2[pos2] == key) {
      values2[pos2] = value;
      return;
    }

    // Insert the key-value pair into the first table
    for (int i = 0; i < MAX_LOOP; i++) {
      if (keys1[pos1] == null) {
        keys1[pos1] = key;
        values1[pos1] = value;
        return;
      }

      // There's a collision, we need to cuckoo the existing element
      // Swap the current element with the one that's there
      K tempKey = keys1[pos1]!;
      V tempValue = values1[pos1]!;
      keys1[pos1] = key;
      values1[pos1] = value;
      key = tempKey;
      value = tempValue;

      // Move to second table
      pos2 = _hash2(key);
      if (keys2[pos2] == null) {
        keys2[pos2] = key;
        values2[pos2] = value;
        return;
      }

      // Swap and continue the process
      tempKey = keys2[pos2]!;
      tempValue = values2[pos2]!;
      keys2[pos2] = key;
      values2[pos2] = value;
      key = tempKey;
      value = tempValue;
      pos1 = _hash1(key);  // Cycle back to first table
    }

    throw Exception('Hash table insert failed after maximum attempts');
  }

  V? search(K key) {
    int pos1 = _hash1(key);
    if (keys1[pos1] == key) return values1[pos1];
    int pos2 = _hash2(key);
    if (keys2[pos2] == key) return values2[pos2];
    return null;
  }

  bool remove(K key) {
    int pos1 = _hash1(key);
    if (keys1[pos1] == key) {
      keys1[pos1] = null;
      values1[pos1] = null;
      return true;
    }
    int pos2 = _hash2(key);
    if (keys2[pos2] == key) {
      keys2[pos2] = null;
      values2[pos2] = null;
      return true;
    }
    return false;
  }

  void display() {
    print('Table 1:');
    for (int i = 0; i < capacity; i++) {
      if (keys1[i] != null) print('$i: ${keys1[i]} -> ${values1[i]}');
    }
    print('Table 2:');
    for (int i = 0; i < capacity; i++) {
      if (keys2[i] != null) print('$i: ${keys2[i]} -> ${values2[i]}');
    }
  }
}

void main() {
  var hashTable = CuckooHashTable<String, String>(5);
  hashTable.insert('name', 'Alice');
  hashTable.insert('role', 'Engineer');
  hashTable.insert('location', 'New York');
  hashTable.display();
  print('Searching for "role": ${hashTable.search("role")}');
  // hashTable
}