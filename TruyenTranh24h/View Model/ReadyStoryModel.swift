//
//  ReadyStoryModel.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 22/08/2021.
//

import Foundation
import Combine

class ReadStoryModel: ObservableObject {
    @Published var chapter: Chapter
    @Published var story: Story
    var chapterStream: AnyCancellable?
    
    init(chapter: Chapter, story: Story) {
        self.chapter = chapter
        self.story = story
        
        getChapterImages()
    }
    @Published var isError: Bool = false
    var error: Error?
    
    func setError(error: Error) {
        self.error = error
        isError = true
    }
    
    private func getChapterImages() {
        chapterStream = ChapterAPI.shared.getChapterImages(id: chapter.id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                print(error)
                self.setError(error: error)
            }
        }, receiveValue: { c in
            self.chapter = c
        })
    }
    
    func nextChapter() {
        guard let chapters = story.chapters,
            let index = chapters.firstIndex(where: { $0.id == chapter.id }) else { return }
        
        let nextIndex = chapters.index(after: index)
        if nextIndex < chapters.count {
            chapter = chapters[nextIndex]
            getChapterImages()
        }
    }
    
    func preChapter() {
        guard let chapters = story.chapters,
            let index = chapters.firstIndex(where: { $0.id == chapter.id }) else { return }
        
        let preIndex = chapters.index(before: index)
        if preIndex >= 0 {
            chapter = chapters[preIndex]
            getChapterImages()
        }
    }
}
