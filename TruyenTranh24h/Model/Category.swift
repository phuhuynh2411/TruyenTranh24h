//
//  Category.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 03/06/2021.
//

import Foundation

struct Category: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let image: String
    
    var imageURLString: String {
        URLSetting.baseImageURL.appendingPathComponent(image.toBase64()).absoluteString
    }
}
/*
 "id": 1,
 "parent_id": null,
 "name": "Drama",
 "slug": "drama",
 "icon": null,
 "image": "stories\/tougen-anki_1621008393.jpg",
 "description": "Drama",
 "status": 1,
 "created_at": "2021-04-22T15:49:59.000000Z",
 "updated_at": "2021-07-05T12:48:24.000000Z",
 "deleted_at": null
 */
