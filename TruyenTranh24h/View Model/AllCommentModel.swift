//
//  AllCommentModel.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 22/08/2021.
//

import Foundation
import Combine

class AllCommentModel: ObservableObject {
    @Published var comments: [Comment]?
    var originalComments: [Comment]
    
    init(comments: [Comment]) {
        originalComments = comments
        addSubComments(comments: comments)
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
        let comments = originalComments.sorted(by: { $0.createdAt > $1.createdAt})
        addSubComments(comments: comments)
    }
    
    func sortCommentOldest() {
        let comments = originalComments.sorted(by: { $0.createdAt < $1.createdAt})
        addSubComments(comments: comments)
    }
}
