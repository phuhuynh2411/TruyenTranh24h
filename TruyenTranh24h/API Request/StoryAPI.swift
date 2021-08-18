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
    
    private func getStories<R>(url: URL, limit: Int? = nil, page: Int? = nil, search: String? = nil, with: String? = nil) -> AnyPublisher<Entry<R>, Error> {
        let urlWithParas = addQueryItems(page: page, limit: limit, search: search, with: with, to: url)
        let request =  getRequest(url: urlWithParas)
        
        return self.send(request: request)
            .eraseToAnyPublisher()
    }
    
    func getFeatureStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.storyFeature)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getRecommendStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.recommendStoryURL, limit: 6)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getMaybeYouLikeStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.maybeYouLikeURL, limit: 6)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getHotStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.hotStoryURL, limit: 10)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getTrailerStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.trailerStoryURL, limit: 10)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getStories() -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.storyURL, limit: 20)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getStories(by category: Category, page: Int? = nil, search: String? = nil) -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.storiesByCategoryURL(categoryId: category.id), page: page, search: search)
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getStoryDetail(by id: Int, with: String? = nil) -> AnyPublisher<Story, Error> {
        return getStories(url: URLSetting.storyDetailByIdURL(id: id), with: with)
            .tryCompactMap { try self.storyDetail(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getRelatedStories(by story: Story) -> AnyPublisher<[Story], Error> {
        return getStories(url: URLSetting.relatedStoriesURL(id: story.id))
            .tryMap { try self.validate(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    func getStoryComments(by story: Story) -> AnyPublisher<[Comment], Error> {
        return getStories(url: URLSetting.storyCommentsULR(id: story.id))
            .tryMap { try self.validateComment(entry: $0) }
            .eraseToAnyPublisher()
    }
    
    internal func validate(entry: Entry<ResponseData>) throws -> [Story] {
        return entry.data?.data ?? []
    }
    
    internal func validateComment(entry: Entry<[Comment]>) throws -> [Comment] {
        return entry.data ?? []
    }
    
    internal func storyDetail(entry: Entry<Story>) throws -> Story? {
        return entry.data
    }
    
    // MARK: - ResponseData
    struct ResponseData: Codable {
        let data: [Story]
    }
    
    struct StoryDetailResponse: Codable {}
}
