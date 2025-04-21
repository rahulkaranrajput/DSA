class Solution {
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
        var result = [Int]()
        var carry = k
        var i = num.count - 1

        while i >= 0 || carry > 0 {
            if i >= 0 {
                carry += num[i]
            }
            result.insert(carry % 10, at: 0)
            carry /= 10
            i -= 1
        }
        return result
    }
}

var obj = Solution()
var num = [9,9,9]
let array = obj.addToArrayForm(num, 78778)
print("array", array);
