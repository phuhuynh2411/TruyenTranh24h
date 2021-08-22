//
//  StoryViewModel.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 11/08/2021.
//

import Foundation
import Combine

class StoryViewModel: ObservableObject {
    @Published var story: Story
    @Published var relatedStories: [Story]?
    
    @Published var isError: Bool = false
    @Published var comments: [Comment]?
    var originalComments: [Comment]?
    var error: Error?
    
    private var storyDetailStream: AnyCancellable?
    private var relatedStoriesStream: AnyCancellable?
    private var storyCommentStream: AnyCancellable?
    
    init(story: Story) {
        self.story = story
        getStoryDetail()
        getRelatedStories()
        getStoryComments()
    }
    
    func setError(error: Error) {
        self.error = error
        isError = true
    }
    
    private func getStoryDetail() {
        storyDetailStream = StoryAPI.shared.getStoryDetail(by: story.id, with: "categories;chapters;last_chapter;favorites")
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
                self.setError(error: error)
            }
        }, receiveValue: { story in
            self.story = story
        })
    }
    
    private func getRelatedStories() {
        relatedStoriesStream = StoryAPI.shared.getRelatedStories(by: story)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
                self.setError(error: error)
            }
        }, receiveValue: { relatedStories in
            self.relatedStories = relatedStories
        })
    }
    
    private func getStoryComments() {
        storyCommentStream = StoryAPI.shared.getStoryComments(by: story)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
                self.setError(error: error)
            }
        }, receiveValue: { storyComments in
            self.originalComments = storyComments
            self.sortCommentOldest()
        })
    }
    
    private func addSubComments(comments: [Comment]?) {
        var allComments: [Comment] = []
        comments?.forEach { comment in
            allComments.append(comment)
            comment.children?.forEach { subComment in
                allComments.append(subComment)
            }
        }
        self.comments = allComments
    }
    
    func sortCommentNewest() {
        let comments = originalComments?.sorted(by: { $0.createdAt > $1.createdAt})
        addSubComments(comments: comments)
    }
    
    func sortCommentOldest() {
        let comments = originalComments?.sorted(by: { $0.createdAt < $1.createdAt})
        addSubComments(comments: comments)
    }
}
