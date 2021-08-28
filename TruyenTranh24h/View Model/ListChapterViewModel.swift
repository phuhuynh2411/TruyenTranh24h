//
//  ListChapterViewModel.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 27/08/2021.
//

import Foundation
import Combine

class ListChapterViewModel: ObservableObject {
    @Published var story: Story
    @Published var chapters: [Chapter]?
    
    init(story: Story) {
        self.story = story
        chapters = story.chapters
    }
    
    static func sortChaptersNewest(story: Story) -> ListChapterViewModel {
        let instance = ListChapterViewModel(story: story)
        instance.sortChaptersNewest()
        return instance
    }
    
    func sortChaptersNewest(completionHandler: (()->Void)? = nil ) {
        chapters = chapters?.sorted(by: { $0.createdAt.compare($1.createdAt) == .orderedDescending })
        completionHandler?()
    }
    
    func sortChaptersOldest(completionHandler: (()->Void)? = nil ) {
        chapters = chapters?.sorted(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending })
        completionHandler?()
    }
}
