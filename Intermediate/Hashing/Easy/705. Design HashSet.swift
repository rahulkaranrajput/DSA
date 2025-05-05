/*
Design a HashSet without using any built-in hash table libraries.

Implement MyHashSet class:

void add(key) Inserts the value key into the HashSet.
bool contains(key) Returns whether the value key exists in the HashSet or not.
void remove(key) Removes the value key in the HashSet. If key does not exist in the HashSet, do nothing.


Example 1:

Input
["MyHashSet", "add", "add", "contains", "contains", "add", "contains", "remove", "contains"]
[[], [1], [2], [1], [3], [2], [2], [2], [2]]
Output
[null, null, null, true, false, null, true, null, false]

Explanation
MyHashSet myHashSet = new MyHashSet();
myHashSet.add(1);      // set = [1]
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(1); // return True
myHashSet.contains(3); // return False, (not found)
myHashSet.add(2);      // set = [1, 2]
myHashSet.contains(2); // return True
myHashSet.remove(2);   // set = [1]
myHashSet.contains(2); // return False, (already removed)


Constraints:

0 <= key <= 106
At most 104 calls will be made to add, remove, and contains.
*/

class MyHashSet {
  private var buckets: [[Int]]
  private let size = 1000

  init() {
    buckets = Array(repeating: [], count: size)
  }

  private func hash(_ key: Int) -> Int {
    return key % size
  }

  func add(_ key: Int) {
    let idx = hash(key)
    if !buckets[idx].contains(key) {
      buckets[idx].append(key)
    }
  }

  func remove(_ key: Int) {
    let idx = hash(key)
    if let i = buckets[idx].firstIndex(of: key) {
      buckets[idx].remove(at: i)
    }
  }

  func contains(_ key: Int) -> Bool {
    let idx = hash(key)
    return buckets[idx].contains(key)
  }
}
