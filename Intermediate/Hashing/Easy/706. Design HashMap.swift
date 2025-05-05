/*
Design a HashMap without using any built-in hash table libraries.

Implement the MyHashMap class:

MyHashMap() initializes the object with an empty map.
void put(int key, int value) inserts a (key, value) pair into the HashMap. If the key already exists in the map, update the corresponding value.
int get(int key) returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
void remove(key) removes the key and its corresponding value if the map contains the mapping for the key.
*/

class MyHashMap {
    private var buckets: [[(Int,Int)]]
    private let size = 1000;
   
    init() {
        buckets = Array(repeating: [(Int, Int)](), count: size)
    }

    private func hash(_ key: Int) -> Int {
        return key % size
    }
    
    func put(_ key: Int, _ value: Int) {
        let index = hash(key);
        for i in 0..<buckets[index].count{
            if buckets[index][i].0 == key {
                buckets[index][i].1 = value
                return
            }
        }
        buckets[index].append((key, value))
    }
    
    func get(_ key: Int) -> Int {
        let index = hash(key);
        for pair in buckets[index] {
            if pair.0 == key {
                return pair.1
            }
        }
        return -1;
    }
    
    func remove(_ key: Int) {
        let index = hash(key);
        for i in 0..<buckets[index].count{
            if buckets[index][i].0 == key {
                buckets[index].remove(at: i);
                return;
            }
        }
    }
}