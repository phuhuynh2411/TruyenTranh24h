//
//  Story.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import Foundation

struct Story: Codable, Identifiable, Equatable {
    static func == (lhs: Story, rhs: Story) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let userId: Int
    let title: String
    let subTitle: String
    let isHot: Bool
    let isFeature: Bool
    let isAdult: Bool
    var featureImage: String
    
    // Chapter
    let description: String
    let createdAt: Date
    let trailerImage: String?
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter.string(from: createdAt)
    }
    
    var imageURLString: String {
        URLSetting.baseImageURL.appendingPathComponent(featureImage.toBase64()).absoluteString
    }
    
    static func placeholder(id: Int) -> Story {
        let text = "Nullam id dolor id nibh ultricies nullam quis risus eget urna mollis ornare vel eu leo."
        let title = String(text.prefix(Int.random(in: 15..<30)))
        return Story(id: id, userId: 0, title: title, subTitle: "", isHot: true, isFeature: true, isAdult: true, featureImage: "", description: "", createdAt: Date(), trailerImage: "")
    }
}
