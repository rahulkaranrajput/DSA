class Solution {
    func getConcatenation(_ nums: [Int]) -> [Int] {
        var newarray = [Int]()
        newarray.append(contentsOf: nums);
        newarray.append(contentsOf: nums);
        return newarray;
    }
}