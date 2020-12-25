//
//  ArrayExtension.swift
//  Keep
//
//  Created by 顾钱想 on 2020/9/8.
//  Copyright © 2020 顾钱想. All rights reserved.
//
import UIKit

extension Array {
    ///数组分组
    ///count:每组几个
    func split(count: Int) -> [[Element]] {

        let moNum = self.count % count
        let num = self.count / count
        let index = moNum == 0 ? (num) : (self.count / count + 1)

        var last: [[Element]] = []
        for i in 0..<index {
            var tmp: [Element] = []
            let tmpCount = (i == index - 1 && moNum != 0) ? moNum : count
            for j in 0..<tmpCount {
                tmp.append(self[count * i + j])
            }
            last.append(tmp)
        }
        return last
    }
    ///数组分组
    ///key、属性相同的为一组
    func group<U: Hashable>(by key: (Element) -> U) -> [[Element]] {
      //keeps track of what the integer index is per group item
      var indexKeys = [U : Int]()

      var grouped = [[Element]]()
      for element in self {
        let key = key(element)
        
        if let ind = indexKeys[key] {
          grouped[ind].append(element)
        }
        else {
          grouped.append([element])
          indexKeys[key] = grouped.count - 1
        }
      }
      return grouped
    }
}
