//
//  ChapterAPI.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 22/08/2021.
//

import Foundation
import Combine

class ChapterAPI: API {
    static let shared = ChapterAPI()
    
    private func buildRequest(url: URL, limit: Int?) -> URLRequest {
        let urlWithParas = addQueryItems(limit: limit, to: url)
        let request = getRequest(url: urlWithParas)
        
        return request
    }
    
    private func get(url: URL, limit: Int? = nil) -> AnyPublisher<Entry<Chapter>, Error> {
        let request =  buildRequest(url: url, limit: limit)
        
        return self.send(request: request)
            .eraseToAnyPublisher()
    }
    
    func getChapterImages(id: Int) -> AnyPublisher<Chapter, Error> {
        return get(url: URLSetting.chapterImagesURL(id: id))
            .tryCompactMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    internal func validate(entry: Entry<Chapter>) throws -> Chapter? {
        return entry.data
    }
}
