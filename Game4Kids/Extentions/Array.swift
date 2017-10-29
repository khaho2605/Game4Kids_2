//
//  Array.swift
//  Game4Kids
//
//  Created by KHA on 12/13/16.
//  Copyright © 2016 Kha. All rights reserved.
//

import Foundation

extension MutableCollection where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
}

extension Array {
    func randomArr(arrSource: [Any]) -> [Any] {
        var arr = [Any]()
        arr = arrSource
        arr.shuffle()
        return arr
    }
}
