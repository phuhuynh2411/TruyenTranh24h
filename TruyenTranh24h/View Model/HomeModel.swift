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
    @Published var carouselItems = [Carousel]()
    @Published var recommendStories = [Story]()
    @Published var maybeYouLikeStories = [Story]()
    @Published var hotStories = [Story]()
    @Published var trailerStories = [Story]()
    @Published var dailyUpdateStories = [Story]()
    @Published var categories = [Category]()

    init() {
        fetchData()
    }
    
    private var dataStream: AnyCancellable?
    
    func fetchData(isPullToRefresh: Bool = false) {
        refresh = isPullToRefresh
        
        let pub1 = Publishers
            .CombineLatest4(
                StoryAPI.shared.getFeatureStories(),
                CategoryAPI.shared.getCategories(),
                StoryAPI.shared.getRecommendStories(),
                StoryAPI.shared.getMaybeYouLikeStories())
        let pub2 = Publishers.CombineLatest4(
                pub1,
                StoryAPI.shared.getHotStories(),
                StoryAPI.shared.getTrailerStories(),
                StoryAPI.shared.getStories())
        dataStream = pub2
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
            self.refresh = false
                
        }, receiveValue: { pub1, hotStories, trailerStories, dailyUpdateStories in
            // feature stories
            self.featureStories = pub1.0
            self.carouselItems = pub1.0.map { story in
                Carousel(id: story.id, stringURL: story.imageURLString)
            }
            
            // feature stories
            self.categories = pub1.1
            self.recommendStories = pub1.2
            self.maybeYouLikeStories = pub1.3
            
            self.hotStories = hotStories
            self.trailerStories = trailerStories
            self.dailyUpdateStories = dailyUpdateStories
            
            // stop refreshing
            self.refresh = false
        })
            
    }
}
