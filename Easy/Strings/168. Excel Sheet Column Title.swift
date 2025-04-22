/*

Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.

For example:

A -> 1
B -> 2
C -> 3
...
Z -> 26
AA -> 27
AB -> 28
...


Example 1:

Input: columnNumber = 1
Output: "A"
Example 2:

Input: columnNumber = 28
Output: "AB"
Example 3:

Input: columnNumber = 701
Output: "ZY"


Constraints:

1 <= columnNumber <= 231 - 1
*/

class Solution {
  func convertToTitle(_ columnNumber: Int) -> String {
    var num = columnNumber
    var result = ""

    while num > 0 {
      num -= 1
      let char = Character(UnicodeScalar(num % 26 + 65)!)
      result = String(char) + result
      num /= 26
    }

    return result
  }
}
