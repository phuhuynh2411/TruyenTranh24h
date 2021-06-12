//
//  Comment.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 12/06/2021.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id: Int
    let userName: String
    let comment: String
    let createdAt: Date
    let avatar: String?
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: createdAt)
    }
}
