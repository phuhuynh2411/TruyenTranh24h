//
//  URLSettings.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 22/04/2021.
//

import Foundation

class URLSetting {    
    static var baseURL: URL { URL(string: "https://truyentranh24h.net/storage/")! }
    static var loginURL: URL { baseURL.appendingPathComponent("api/v1/login") }
}
