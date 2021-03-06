//
//  Chapter.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 14/04/2021.
//

import Foundation

struct Chapter: Codable, Identifiable {
    let id: Int
    let title: String
    
    let releasedDate: Date?
    let createdAt: Date
    let updatedAt: Date
    var formattedRelasedDate: String {
        guard let date = releasedDate else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: date)
    }
    let images: [String]?
}
