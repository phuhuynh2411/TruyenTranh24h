//
//  StoryAPI.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 05/08/2021.
//

import Foundation
import Combine

class StoryAPI: API {
    static let shared = StoryAPI()
    
    private func buildRequest(url: URL) -> URLRequest {
        return getRequest(url: url)
    }
    
    private func getStories(url: URL) -> AnyPublisher<Entry<ResponseData>, Error> {
        let request =  buildRequest(url: url)
        
        return self.send(request: request)
            .eraseToAnyPublisher()
    }
    
    func getFeatureStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.storyFeature)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    internal func validate(entry: Entry<ResponseData>) throws -> [Story] {
        return entry.data?.data ?? []
    }
    
    // MARK: - ResponseData
    struct ResponseData: Codable {
        let data: [Story]
    }
}
