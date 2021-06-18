//
//  StringExtension.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 18/06/2021.
//

import Foundation

extension String {
    var wordCounts: Int {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        let words = components.filter { !$0.isEmpty }
        
        return words.count
    }
    
    func words(_ numberOfWord: Int) -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        let words = components.filter { !$0.isEmpty }.prefix(numberOfWord)
        
        return words.joined(separator: " ")
    }
}
