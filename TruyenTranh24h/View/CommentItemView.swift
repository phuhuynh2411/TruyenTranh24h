//
//  CommentItemView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 12/06/2021.
//

import SwiftUI
import RemoteImageView

struct CommentItemView: View {
    @State var comment: Comment
    
    var body: some View {
        HStack(spacing: 16) {
            // avatar
            RemoteImageView(stringURL: comment.avatar ?? "")
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 10) {
                // title
                Text(comment.userName)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.black)
                
                // description
                Text(comment.comment)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color("commentDescriptionTextFg"))
                
                HStack (spacing: 30) {
                    // date and time
                    Text(comment.formattedDate)
                        .font(.system(size: 9, weight: .light))
                        .foregroundColor(Color("commentDateFg"))
                    
                    // answer button
                    Button(action: {}, label: {
                        Text("answer")
                            .font(.system(size: 9, weight: .regular))
                            .foregroundColor(Color("answerButtonFg"))
                    })
                    
                }
            }
        }
    }
}

struct CommentItemView_Previews: PreviewProvider {
    static var previews: some View {
        CommentItemView(comment: SampleData.comments()[0])
    }
}
