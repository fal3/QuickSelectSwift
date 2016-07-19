//: Playground - noun: a place where people can play


import UIKit

func lomutoPartition<T: Comparable>(inout A: [T], left: Int, right: Int) -> Int {
    let pivot = A[right]
    
    var s = left
    for j in left..<right {
        if A[j] <= pivot {
            (A[s], A[j]) = (A[j], A[s])
            s += 1
        }
    }
    
    (A[s], A[right]) = (A[right], A[s])
    return s
}
/*
 Swift's swap() doesn't like it if the items you're trying to swap refer to
 the same memory location. This little wrapper simply ignores such swaps.
 */
public func swap<T>(inout a: [T], _ i: Int, _ j: Int) {
    if i != j {
        swap(&a[i], &a[j])
    }
}

func quickSelect<T: Comparable>(inout a: [T], _ low: Int, _ high: Int, _ k: Int) -> T {
    
    if low < high {
        let p = lomutoPartition(&a, left: low, right: high)
        if k == p {
            return a[p]
        } else if k < p {
            return quickSelect(&a, low, p - 1, k)  
        } else {
            return quickSelect(&a, p + 1, high, k)
        }
    } else {
        return a[low]
    }
}

func makeList(n:Int ) -> [Int] {
    var result:[Int] = []
    for i in 0..<n {
        result.append(Int(arc4random_uniform(10) + 1))
    }
    return result
}
makeList(12)
makeList(10)


var qSel = [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]

var KAY = qSel.count/2

for i in 0...5 {
    print(i)
}

//Input subarray[Left..Right], kth element, for the example we want the median, so we do qSel.count/2 th element
quickSelect(&qSel, 0, qSel.count-1, KAY)

