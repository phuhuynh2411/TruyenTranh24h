//
//  APISetting.swift
//  Agile Board Team
//
//  Created by Huynh Tan Phu on 3/19/20.
//  Copyright © 2020 Filesoft. All rights reserved.
//

import Foundation

class URLSetting {
    static var baseURL: URL { URL(string: "https://truyentranh24h.net/api/v1")! }
    static var baseImageURL: URL { URL(string: "https://truyentranh24h.net/uploads/images/feature")! }

    // Story
    static var storyFeature: URL { baseURL.appendingPathComponent("stories/features") }
    static var recommendStoryURL: URL { baseURL.appendingPathComponent("stories/recommends") }
    static var maybeYouLikeURL: URL { baseURL.appendingPathComponent("stories/maybe-you-will-like") }
    static var hotStoryURL: URL { baseURL.appendingPathComponent("stories/hot") }
    static var trailerStoryURL: URL { baseURL.appendingPathComponent("stories/trailers") }
    static var storyURL: URL { baseURL.appendingPathComponent("stories") }
    
    // Category
    static var categoryURL: URL { baseURL.appendingPathComponent("categories") }
    static func storiesByCategoryURL(categoryId: Int) -> URL {
        baseURL.appendingPathComponent("categories/\(categoryId)/stories")
    }
    static func storyDetailByIdURL(id: Int) -> URL {
        baseURL.appendingPathComponent("stories/\(id)")
    }
    
    static func relatedStoriesURL(id: Int) -> URL {
        baseURL.appendingPathComponent("stories/\(id)/related")
    }
    
    ///stories/{story}/related

    static var loginURL: URL { baseURL.appendingPathComponent("stories/features") }
}
