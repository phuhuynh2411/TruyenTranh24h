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
    let indent: CGFloat = 48
    
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
                // line view
                LineView()
            }
            
           
        }
        .padding(.leading, comment.parentId != nil ? indent : 0 )
    }
}

struct CommentItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            CommentItemView(comment: SampleData.comments()[0])
            CommentItemView(comment: SampleData.comments()[1])
            CommentItemView(comment: SampleData.comments()[2])
        }
    }
}
