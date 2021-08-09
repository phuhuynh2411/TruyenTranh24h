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
    @Published var isRefreshing = false
    
    var categoryStream: AnyCancellable?
    var storiesStream: AnyCancellable?
    var selectedCategoryStream: AnyCancellable?
    var searchStream: AnyCancellable?
    
    init() {
        getCategories()
        
        selectedCategoryStream = $selectedCategory.sink(receiveValue: { category in
            guard let c = category else { return }
            self.change(category: c)
        })
        
        searchStream = $searchValue
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { value in
            print("Search value: \(value)")
        })
    }
    
    private func change(category: Category) {
        currentPage = 1
        stories = nil
        self.getStories(by: category)
    }
    
    func refetchData() {
        // refresh categories
        categories = nil
        getCategories()
        
        // refresh stories
        stories = nil
        currentPage = 1
        guard let category = selectedCategory else { return }
        self.getStories(by: category)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.isRefreshing = false
        }
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
                self.selectedCategory = (self.selectedCategory == nil) ? firstCategory : self.selectedCategory
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
