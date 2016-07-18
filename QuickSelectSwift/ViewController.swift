//
//  ViewController.swift
//  QuickSelectSwift
//
//  Created by Fallah on 7/16/16.
//  Copyright © 2016 Fallah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var theList = [4,1,10,8,7,12,9,2,15]
        
        let example = lomutoPartition(&theList, left: 0, right: theList.count-1)
        
    }
    
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
    internal func swap<T>(inout A: [T], _ i: Int, _ j: Int) {
        if i != j {
            swap(&A, i, j)
        }
    }
    
    func quickSelect<T: Comparable>(inout A: [T], _ left: Int, _ right: Int, _ k: Int) -> T {
        
        if left < right {
            let p = lomutoPartition(&A, left: left, right: right)
            if k == p {
                return A[p]
            } else if k < p {
                return quickSelect(&A, left, p - 1, k)
            } else {
                return quickSelect(&A, p + 1, right, k)
            }
        } else {
            return A[left]
        }
    }
    
    
    

 


}

