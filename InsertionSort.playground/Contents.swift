import Foundation

func insertionSort<T: Comparable>(_ array: [T]) -> [T] {
    if array.isEmpty {  return [] }
    var array = array
    for index in 1..<array.count {
        var currentIndex = index
        while currentIndex > 0 && array[currentIndex] < array[currentIndex-1] {
            swapAt(currentIndex-1, currentIndex, &array)
            currentIndex -= 1
        }
    }
    
    return array
}

private func swapAt<T: Comparable>(_ a: Int, _ b: Int, _ array: inout [T]) {
    let temp = array[a]
    array[a] = array[b]
    array[b] = temp
}

insertionSort([ 8, 3, 5, 4, 6 ])

insertionSort([ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ])
