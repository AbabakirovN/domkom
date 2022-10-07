//
//  Extensions.swift
//  Domkom
//
//  Created by Nurzhan Ababakirov on 3/5/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.
//

import Foundation

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
        func index(from: Int) -> Index {
            return self.index(startIndex, offsetBy: from)
        }

        func substring(from: Int) -> String {
            let fromIndex = index(from: from)
            return String(self[fromIndex...])
        }

        func substring(to: Int) -> String {
            let toIndex = index(from: to)
            return String(self[..<toIndex])
        }

        func substring(with r: Range<Int>) -> String {
            let startIndex = index(from: r.lowerBound)
            let endIndex = index(from: r.upperBound)
            return String(self[startIndex..<endIndex])
        
    }

}
