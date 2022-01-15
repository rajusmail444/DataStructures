import Foundation

func binarySearch<T: Comparable>(_ sortedArray: [T], _ element: T) -> Int? {
    if sortedArray.isEmpty { return nil }
    var start = 0
    var end = sortedArray.count - 1
    
    while start <= end {
        let mid = start + (end - start)/2
        if sortedArray[mid] == element {
            return mid
        } else if sortedArray[mid] < element {
            start = mid + 1
        } else {
            end = mid
        }
    }

    return nil
}

func binarySearch<T: Comparable>(_ sortedArray: [T], key: T, range: Range<Int>) -> Int? {
    if sortedArray.isEmpty { return nil }
    
    if range.lowerBound < range.upperBound {
        let mid = range.lowerBound + (range.upperBound - range.lowerBound)/2
        
        if sortedArray[mid] < key {
            return binarySearch(sortedArray, key: key, range: mid+1..<range.upperBound)
        } else if sortedArray[mid] > key {
            return binarySearch(sortedArray, key: key, range: range.lowerBound..<mid)
        } else {
            return mid
        }
    }
    return nil
}

let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
binarySearch(numbers, 43)

binarySearch(numbers, key: 43, range: 0..<numbers.count)
