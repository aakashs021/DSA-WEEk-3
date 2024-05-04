class LinearProbingHashTable<K, V> {
  late List<K?> keys;
  late List<V?> values;
  int capacity;
  int size = 0;

  LinearProbingHashTable(this.capacity) {
    keys = List<K?>.filled(capacity, null);
    values = List<V?>.filled(capacity, null);
  }

  int _hash(K key) {
    
    return key.hashCode % capacity;
  }

  void insert(K key, V value) {
    int index = _hash(key);

    while (keys[index] != null && keys[index] != key) {
      index = (index + 1) % capacity; // Linear probing
    }

    if (keys[index] != key) {
      size++;
    }

    keys[index] = key;
    values[index] = value;
  }

  V? lookup(K key) {
    int index = _hash(key);

    while (keys[index] != null) {
      if (keys[index] == key) {
        return values[index];
      }
      index = (index + 1) % capacity; // Linear probing
    }

    return null; // Key not found
  }

  void remove(K key) {
    int index = _hash(key);

    // Find the key
    while (keys[index] != null && keys[index] != key) {
      index = (index + 1) % capacity;
    }

    if (keys[index] == key) {
      // Remove the key and value
      keys[index] = null;
      values[index] = null;
      size--;

      // Rehash all keys in the same cluster
      index = (index + 1) % capacity;
      while (keys[index] != null) {
        K rehashKey = keys[index]!;
        V rehashValue = values[index]!;
        keys[index] = null;
        values[index] = null;
        size--;
        insert(rehashKey, rehashValue);
        index = (index + 1) % capacity;
      }
    }
  }

  void display() {
    print('Hash Table:');
    for (int i = 0; i < capacity; i++) {
      if (keys[i] != null) {
        print('$i: ${keys[i]} -> ${values[i]}');
      }
    }
  }
}

void main() {
  var hashTable = LinearProbingHashTable<String, String>(10);
  hashTable.insert('name', 'Alice');
  hashTable.insert('age', '25');
  hashTable.insert('job', 'Engineer');
  hashTable.insert('dane', 'Bob'); // This will not collide due to linear probing

  print(hashTable.lookup('name')); // Outputs: Bob (since it overwrites Alice)
  // hashTable.remove('age');
  hashTable.display();
}
