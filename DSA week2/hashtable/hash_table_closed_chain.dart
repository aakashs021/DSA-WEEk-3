class HashNode<K, V> {
  K key;
  V value;
  HashNode<K, V>? next;

  HashNode(this.key, this.value);
}

class ChainingHashTable<K, V> {
  List<HashNode<K, V>?> buckets=[];
  int size;
  int capacity;

  ChainingHashTable({required this.capacity}) : size = 0  {
    // buckets = List<HashNode<K, V>?>(capacity);
    buckets=List.filled(capacity, null);
  }

  int _hash(K key) {
    return key.hashCode % capacity;
  }

  void insert(K key, V value) {
    int bucketIndex = _hash(key);
    HashNode<K, V>? head = buckets[bucketIndex];

    // Check if the key is already present
    while (head != null) {
      if (head.key == key) {
        head.value = value;  // Update the value if found
        return;
      }
      head = head.next;
    }

    // Insert key in the chain
    size++;
    head = buckets[bucketIndex];
    HashNode<K, V> newNode = HashNode<K, V>(key, value);
    newNode.next = head;
    buckets[bucketIndex] = newNode;
  }

  V? search(K key) {
    int bucketIndex = _hash(key);
    HashNode<K, V>? head = buckets[bucketIndex];

    // Search the chain at this index
    while (head != null) {
      if (head.key == key) {
        return head.value;
      }
      head = head.next;
    }
    return null;  // Not found
  }

  bool remove(K key) {
    int bucketIndex = _hash(key);
    HashNode<K, V>? head = buckets[bucketIndex];
    HashNode<K, V>? prev = null;

    // Search the key in the chain
    while (head != null) {
      if (head.key == key) {
        break;
      }
      prev = head;
      head = head.next;
    }

    // If key was not there
    if (head == null) return false;

    size--;

    // Remove the key
    if (prev != null) {
      prev.next = head.next;
    } else {
      buckets[bucketIndex] = head.next;
    }
    return true;
  }

  void display() {
    for (int i = 0; i < capacity; i++) {
      if(buckets[i]!=null){

      HashNode<K, V>? head = buckets[i];
      print("Bucket $i: ");
      while (head != null) {
        print("${head.key} -> ${head.value}");
        head = head.next;
      }
      }
    }
  }
}
void main() {
  var hashTable = ChainingHashTable<String, String>(capacity: 10);
  hashTable.insert("name", "Alice");
  hashTable.insert("job", "Engineer");
  hashTable.insert("location", "New York");
  hashTable.insert("name", "Bob");  // This will update "Alice" to "Bob"

  print("Searching for 'name': ${hashTable.search("name")}");
  // hashTable.remove("location");
  hashTable.display();
}
