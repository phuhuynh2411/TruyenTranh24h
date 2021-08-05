//
//  HomeModel.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 05/08/2021.
//

import Foundation
import Combine

class HomeModel: ObservableObject {
    @Published private var featureStories = [Story]()
    @Published var refresh: Bool = false
    @Published var searchValue: String = ""
    
    private var dataStream: AnyCancellable?
    
    private func getFeatureStories() {
        dataStream = StoryAPI.shared.getFeatureStories().sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { stories in
            self.featureStories = stories
        })
    }
}
