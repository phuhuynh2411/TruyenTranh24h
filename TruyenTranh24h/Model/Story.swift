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
    
    let author: String
    let totalViews: Int
    let totalLikes: Int
    
    static func placeholder(id: Int) -> Story {
        let text = "Nullam id dolor id nibh ultricies nullam quis risus eget urna mollis ornare vel eu leo."
        let title = String(text.prefix(Int.random(in: 15..<30)))
        return Story(id: id, userId: 0, title: title, subTitle: "", isHot: true, isFeature: true, isAdult: true, featureImage: "", description: "", createdAt: Date(), trailerImage: "", author: "", totalViews: 0, totalLikes: 0)
    }
    
    var categories: [Category]? = nil
    var listCategory: String {
        return categories?.compactMap{ $0.name }.joined(separator: ", ") ?? ""
    }
    
    var chapters: [Chapter]? = nil
    var lastChapter: Chapter? = nil
    var favorites: [User]? = nil
    
    var nonHTMLDescription: String {
        description.removeHTMLTags()
    }
}

/*
 {
         "id": 1412,
         "user_id": 1,
         "title": "Thám Tử Conan",
         "sub_title": "Tác giả: <a class=\"org\" href=\"http://truyen48.com/tac-gia/aoyama-gsh-196.html\">Aoyama Gōshō</a>",
         "slug": "tham-tu-conan",
         "is_feature": false,
         "is_hot": false,
         "is_adult": false,
         "feature_image": "stories/conan_1552225708.jpg",
         "cover_image": null,
         "translator": null,
         "author": "Aoyama Gōshō",
         "status": 1,
         "status_text": "Đang cập nhật",
         "rates": 0,
         "description": "<p>Nhân vật chính của truyện là một thám tử học sinh trung học có tên là Kudo Shinichi, người đã bị biến thành một cậu bé cỡ học sinh tiểu học và luôn cố gắng truy tìm tung tích tổ chức Áo Đen nhằm lấy lại hình dáng cũ.</p>",
         "total_views": 9488,
         "total_likes": 0,
         "created_at": "2021-04-27T15:45:52.000000Z",
         "updated_at": "2021-06-12T23:50:47.000000Z",
         "last_modified": "2021-06-12T23:50:47.000000Z",
         "likes_count": 1,
         "day_count": 14,
         "week_count": 1099,
         "month_count": 1106,
         "is_like": false,
         "is_favorite": false
       }*/
