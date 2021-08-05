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
    static var storyFeature: URL { baseURL.appendingPathComponent("stories/features") }
    static var loginURL: URL { baseURL.appendingPathComponent("stories/features") }
    
}
