// class Solution {
//     func isZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Int {
//         let n = nums.count
//         var delta = Array(repeating: 0, count: n + 1)
//         for query in queries {
//             guard query.count == 2 else { return -1 }
//             let left = query[0]
//             let right = query[1]
//             delta[left] += 1
//             delta[right + 1] -= 1
//         }
//         for i in 1..<(n+1){
//             delta[i] += delta[i - 1]
//         }
//         let sortednums = nums.sorted{$0>$1}

//         for i in 0..<n{
//             if nums[i] > delta[i]{
//                 return -1
//             }
//         }

//         let maxvalue = sortednums[0]
//         var rightmostValue = abs(delta[n - 1])
        
//         if  maxvalue < rightmostValue {
//             rightmostValue  = rightmostValue - maxvalue
//         }
        
//         return rightmostValue == maxvalue  ? (queries.count - rightmostValue) : -1
//     }
// }


// class Solution {
//     static func maxRemoval(_ nums: [Int], _ queries: [[Int]]) -> Int {
//         let n = nums.count
//         var qEnd = Array(repeating: [Int](), count: n)

//         for query in queries {
//             let start = query[0]
//             let end = query[1]
//             qEnd[start].append(end)
//         }

//         var pq = Heap<Int>(sort: >)
//         var cntQ = Array(repeating: 0, count: n + 1)
//         var dec = 0

//         for i in 0..<n {
//             let x = nums[i]
//             dec += cntQ[i]

//             for end in qEnd[i] {
//                 pq.insert(end)
//             }

//             while x > dec, let top = pq.peek(), top >= i {
//                 cntQ[top + 1] -= 1
//                 pq.remove()
//                 dec += 1
//             }

//             if x > dec {
//                 return -1
//             }
//         }
//         return pq.count
//     }
// }

// struct Heap<T> {
//     var elements: [T] = []
//     let sort: (T, T) -> Bool

//     init(sort: @escaping (T, T) -> Bool) {
//         self.sort = sort
//     }

//     var count: Int {
//         return elements.count
//     }

//     func peek() -> T? {
//         return elements.first
//     }

//     mutating func insert(_ value: T) {
//         elements.append(value)
//         siftUp(from: elements.count - 1)
//     }

//     mutating func remove() -> T? {
//         guard !elements.isEmpty else { return nil }
//         elements.swapAt(0, elements.count - 1)
//         let value = elements.removeLast()
//         siftDown(from: 0)
//         return value
//     }

//     private mutating func siftUp(from index: Int) {
//         var child = index
//         var parent = (child - 1) / 2
//         while child > 0 && sort(elements[child], elements[parent]) {
//             elements.swapAt(child, parent)
//             child = parent
//             parent = (child - 1) / 2
//         }
//     }

//     private mutating func siftDown(from index: Int) {
//         var parent = index
//         while true {
//             let left = 2 * parent + 1
//             let right = 2 * parent + 2
//             var candidate = parent

//             if left < elements.count && sort(elements[left], elements[candidate]) {
//                 candidate = left
//             }

//             if right < elements.count && sort(elements[right], elements[candidate]) {
//                 candidate = right
//             }

//             if candidate == parent { return }

//             elements.swapAt(parent, candidate)
//             parent = candidate
//         }
//     }
// }



// let nums = [1,0,2]
// let queries = [[0,2], [1,1], [0,2]]

// let result = Solution().maxRemoval(nums, queries)
// print(result)

class Solution {
    func lexicographicallySmallestString2(_ s: String) -> String {

        func isConsecutive(_ c1: Character, _ c2: Character) -> Bool {
            let c1Val = Int(c1.asciiValue!), c2Val = Int(c2.asciiValue!)
            let (minVal, maxVal) = c1Val <= c2Val ? (c1Val, c2Val) : (c2Val, c1Val)
            return (maxVal - minVal == 1) || (minVal == Int(Character("a").asciiValue!) && maxVal == Int(Character("z").asciiValue!))
        }

        func dfs(_ current: String, _ memo: inout Set<String>) -> String? {
            if memo.contains(current) {
                return nil
            }
            memo.insert(current)

            var result = current

            let chars = Array(current)

            for i in 0..<chars.count - 1 {
                if isConsecutive(chars[i], chars[i + 1]) {
                    let newStr = String(chars[0..<i] + chars[(i + 2)...])
                    if let candidate = dfs(newStr, &memo) {
                        if result.isEmpty || (!candidate.isEmpty && candidate < result) {
                            result = candidate
                        }
                    }
                }
            }

            return result
        }

        var memo: Set<String> = []
        return dfs(s, &memo) ?? s
    }

    func lexicographicallySmallestString(_ s: String) -> String {
    let gralvenoti = s
    
    func isConsecutive(_ c1: Character, _ c2: Character) -> Bool {
        let c1Val = Int(c1.asciiValue!), c2Val = Int(c2.asciiValue!)
        let (minVal, maxVal) = c1Val <= c2Val ? (c1Val, c2Val) : (c2Val, c1Val)
        return (maxVal - minVal == 1) || (minVal == Int(Character("a").asciiValue!) && maxVal == Int(Character("z").asciiValue!))
    }
    
    func dfs(_ current: String, _ memo: inout Set<String>) -> String? {
        if memo.contains(current) {
            return nil
        }
        memo.insert(current)
        
        var result = current
        let chars = Array(current)
        
        for i in 0..<chars.count - 1 {
            if isConsecutive(chars[i], chars[i + 1]) {
                let newStr: String
                if i + 2 < chars.count {
                    newStr = String(chars[0..<i]) + String(chars[i + 2..<chars.count])
                } else {
                    newStr = String(chars[0..<i])
                }
                if let candidate = dfs(newStr, &memo) {
                    if result.isEmpty || (!candidate.isEmpty && candidate < result) {
                        result = candidate
                    }
                }
            }
        }
        
        return result
    }
    
    var memo: Set<String> = []
    return dfs(s, &memo) ?? s
}
}

let result = Solution().lexicographicallySmallestString("bcda")
print(result)