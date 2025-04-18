

// Binary Search

func binarySearch<T: Comparable>(_ array: [T], _ target: T) -> Int {
    var left = 0
    var right = array.count - 1

    while left <= right {
        let mid = left + ((right - left) / 2)
        if array[mid] == target {
            return mid
        } else if array[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return -1
}


var array = [12,23,45,67,78,89,98];

let index = binarySearch(array, 78);

print(index);