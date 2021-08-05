//
//  HomeModel.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 05/08/2021.
//

import Foundation
import Combine
import CarouselView

class HomeModel: ObservableObject {
    @Published private var featureStories = [Story]()
    @Published var refresh: Bool = false
    @Published var searchValue: String = ""
    @Published var carouselItems: [Carousel]?
    @Published var recommendStories: [Story]?
    @Published var maybeYouLikeStories: [Story]?
    @Published var hotStories: [Story]?
    @Published var trailerStories: [Story]?
    @Published var dailyUpdateStories: [Story]?

    init() {
        getFeatureStories()
        getRecomendStories()
        getMaybeYouLikeStories()
        getHotStories()
        getTrailerStories()
        getDailyUpdateStories()
    }
    
    private var featureStream: AnyCancellable?
    private var recommendStream: AnyCancellable?
    private var maybeYouLikeStream: AnyCancellable?
    private var hotStream: AnyCancellable?
    private var trailerStream: AnyCancellable?
    private var dailyStream: AnyCancellable?
    
    private func getFeatureStories() {
        featureStream = StoryAPI.shared.getFeatureStories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { stories in
            self.featureStories = stories
            self.carouselItems = stories.map { story in
                Carousel(id: story.id, stringURL: story.imageURLString)
            }
        })
    }
    
    private func getRecomendStories() {
        recommendStream = StoryAPI.shared.getRecommendStories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { stories in
            self.recommendStories = stories
        })
    }
    
    private func getMaybeYouLikeStories() {
        maybeYouLikeStream = StoryAPI.shared.getMaybeYouLikeStories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { stories in
            self.maybeYouLikeStories = stories
        })
    }
    
    private func getHotStories() {
        hotStream = StoryAPI.shared.getHotStories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { stories in
            self.hotStories = stories
        })
    }
    
    private func getTrailerStories() {
        trailerStream = StoryAPI.shared.getTrailerStories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { stories in
            self.trailerStories = stories
        })
    }
    
    private func getDailyUpdateStories() {
        dailyStream = StoryAPI.shared.getStories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { stories in
            self.dailyUpdateStories = stories
        })
    }
}
