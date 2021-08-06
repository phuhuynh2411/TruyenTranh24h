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
    
    private func buildRequest(url: URL, limit: Int?) -> URLRequest {
        let urlWithParas = addQueryItems(limit: limit, to: url)
        let request = getRequest(url: urlWithParas)
        
        return request
    }
    
    private func getStories(url: URL, limit: Int? = 6) -> AnyPublisher<Entry<ResponseData>, Error> {
        let request =  buildRequest(url: url, limit: limit)
        
        return self.send(request: request)
            .eraseToAnyPublisher()
    }
    
    func getFeatureStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.storyFeature)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getRecommendStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.recommendStoryURL)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getMaybeYouLikeStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.maybeYouLikeURL)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getHotStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.hotStoryURL, limit: 10)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getTrailerStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.trailerStoryURL)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.storyURL, limit: 20)
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
