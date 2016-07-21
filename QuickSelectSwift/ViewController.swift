//
//  ViewController.swift
//  QuickSelectSwift
//
//  Created by Fallah on 7/16/16.
//  Copyright © 2016 Fallah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var bars: [UIImageView]!
    
    var list = [Int]()
    
    var barImages : [UIImageView] = [UIImageView]()
    
    @IBOutlet var median: UILabel!
    
    @IBAction func nextTapped(sender: UIButton) {
        //UIElements
        list = makeList(10)
        let med = quickSelect(&list, 0, list.count-1, list.count/2)
        median.text = "Median: \(med)"
        
        changePics(list)
        
        
    }
    
    func changePics(list: [Int])  {
        for i in 0...self.bars.count-1 {
            self.bars[i].image = UIImage(named: "\(list[i])")
        }
        
    }
    
    func makeList(n:Int ) -> [Int] {
        var result:[Int] = []
        for i in 0..<n {
            result.append(Int(arc4random_uniform(10) + 1))
        }
        return result
    }
    
    
    @IBOutlet var pivotPosLabel: UILabel!
    
    
    @IBOutlet var listLabel: UILabel!
    
    var pivs = [String]()
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
    
    
    //MARK: QuickSelect
    
    /*
     Input: Subarray A[left to right], kth smallest element.
     Output: the Kth smallest element
     k = Array.count / 2
     Ex: Input(Array,k)
     Output: Median of array
     */
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

