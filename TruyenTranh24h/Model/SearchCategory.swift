//
//  SearchCategory.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 11/06/2021.
//

import Foundation

struct SearchCategory: Codable, Identifiable, Equatable {
    let id: Int
    let title: String
    
    static func == (lhs: SearchCategory, rhs: SearchCategory) -> Bool {
        lhs.id == rhs.id
    }

}
