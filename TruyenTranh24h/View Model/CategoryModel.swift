//
//  CategoryModel.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 07/08/2021.
//

import Foundation
import Combine

class CategoryModel: ObservableObject {
    @Published var stories: [Story]?
    @Published var searchValue: String = ""
    
    @Published var categories: [Category]?
    @Published var selectedCategory: Category?
    private var currentPage: Int = 1
    
    var categoryStream: AnyCancellable?
    var storiesStream: AnyCancellable?
    var selectedCategoryStream: AnyCancellable?
    
    init() {
        getCategories()
        
        selectedCategoryStream = $selectedCategory.sink(receiveValue: { category in
            guard let c = category else { return }
            self.change(category: c)
        })
    }
    
    private func change(category: Category) {
        currentPage = 1
        stories = nil
        self.getStories(by: category)
    }
    
    private func getCategories() {
        categoryStream = CategoryAPI.shared.getCategories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { categories in
            self.categories = categories
            if let firstCategory = categories.first {
                self.selectedCategory = firstCategory
            }
        })
    }
    
    private func getStories(by category: Category) {
        storiesStream = StoryAPI.shared.getStories(by: category, page: currentPage)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { stories in
            if self.stories == nil {
                self.stories = stories
            } else {
                self.stories?.append(contentsOf: stories)
            }
            // increase page number
            if stories.count > 0 {
                self.currentPage += 1
            }
        })
    }
    
    func loadMoreStory() {
        guard let category = selectedCategory else { return }
        getStories(by: category)
        print("\(category.name) is loading more stories at page \(currentPage)")
    }
}
