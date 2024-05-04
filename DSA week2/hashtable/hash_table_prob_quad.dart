class QuadraticProbingHashTable<K, V> {
  late List<K?> keys;
  late List<V?> values;
  int capacity;
  int size = 0;

  QuadraticProbingHashTable(this.capacity) {
    keys = List<K?>.filled(capacity, null);
    values = List<V?>.filled(capacity, null);
  }

  int _hash(K key) {
    return key.hashCode % capacity;
  }

  void insert(K key, V value) {
    int index = _hash(key);
    int i = 0;

    while (keys[index] != null && keys[index] != key) {
      i++;
      index = (index + i * i) % capacity; // Quadratic probing
    }

    if (keys[index] != key) {
      size++;
    }

    keys[index] = key;
    values[index] = value;
  }

  V? lookup(K key) {
    int index = _hash(key);
    int i = 0;

    while (keys[index] != null) {
      if (keys[index] == key) {
        return values[index];
      }
      i++;
      index = (index + i * i) % capacity; // Quadratic probing
    }

    return null; // Key not found
  }

  void remove(K key) {
    int index = _hash(key);
    int i = 0;

    // Find the key
    while (keys[index] != null && keys[index] != key) {
      i++;
      index = (index + i * i) % capacity;
    }

    if (keys[index] == key) {
      // Remove the key and value
      keys[index] = null;
      values[index] = null;
      size--;

      // Rehash all keys in the same cluster
      i++;
      index = (index + i * i) % capacity;
      while (keys[index] != null) {
        K rehashKey = keys[index]!;
        V rehashValue = values[index]!;
        keys[index] = null;
        values[index] = null;
        size--;
        insert(rehashKey, rehashValue);
        i++;
        index = (index + i * i) % capacity;
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
  var hashTable = QuadraticProbingHashTable<String, String>(10);
  hashTable.insert('name', 'Alice');
  hashTable.insert('age', '25');
  hashTable.insert('job', 'Engineer');
  hashTable.insert('dane', 'Bob'); // Avoid collision with quadratic probing

  print(hashTable.lookup('name')); // Outputs: Alice or Bob based on hash calculation
  hashTable.remove('age');
  hashTable.display();
}
