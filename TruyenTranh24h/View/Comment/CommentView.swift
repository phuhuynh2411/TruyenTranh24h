//
//  CommentView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 14/06/2021.
//

import SwiftUI

struct CommentView: View {
    @State var comments: [Comment]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // title
            Text("comment-title")
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.black)
            
            ForEach(comments) { comment in
                CommentItemView(comment: comment)
            }
        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(comments: SampleData.comments())
    }
}
