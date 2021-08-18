//
//  Comment.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 12/06/2021.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id: Int
    let userId: Int?
    let body: String
    let createdAt: Date
    let avatarUrl: String?
    let parentId: Int?
    let children: [Comment]?
    let user: User?
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: createdAt)
    }
}

/*
 "id": 27,
 "user_id": 8,
 "story_id": 1148,
 "name": null,
 "email": null,
 "body": "ad oi, khi nao cho chuong 55?",
 "parent_id": null,
 "created_at": "2021-04-05T14:17:32.000000Z",
 "updated_at": "2021-04-05T14:17:32.000000Z",
 "avatar_url": "http://www.gravatar.com/avatar/4cb6190949f6cde996f25e954c979921?d=identicon&r=PG",
 "children": [],
 */
