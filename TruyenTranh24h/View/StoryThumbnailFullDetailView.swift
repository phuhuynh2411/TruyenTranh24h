//
//  StoryThumbnailFullDetailView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 22/07/2021.
//

import SwiftUI
import RemoteImageView

struct StoryThumbnailFullDetailView: View {
    @State var story: Story
    @State var thumbnailHeight: CGFloat? = nil
    
    var body: some View {
        HStack (spacing: 20){
            RemoteImageView(stringURL: story.featureImage)
                .scaledToFill()
                .frame(width: 150, height: thumbnailHeight)
                .clipped()
                .cornerRadius(7.0)
            
            
            VStack (spacing: 12){
                HStack {
                    Text(story.title)
                        .font(.system(size: 13, weight: .medium))
                    Spacer()
                }
                
                HStack {
                    Text("author")
                    Text("Truong vo ki")
                    Spacer()
                }
                .font(.system(size: 12, weight: .regular))
                
                ViewLikeLoveView()
                
                Spacer()
                HStack {
                    Text("Cap nhat den 98")
                        .font(.system(size: 12, weight: .regular))
                        .italic()
                        .foregroundColor(Color("categoryTextFg"))
                    Spacer()
                }
               
            }
        }
            
    }
}

private struct ViewLikeLoveView: View {
    var body: some View {
        HStack (spacing: 20){
            // view
            HStack {
                Image("view")
                    .resizable()
                    .frame(width: 16, height: 9)
                    .foregroundColor(Color("categoryTextFg"))
                
                Text("1.560")
                    .font(.system(size: 9, weight: .regular))
                    .foregroundColor(Color("categoryTextFg"))
            }
            
            HStack {
                Image("like")
                    .resizable()
                    .frame(width: 12, height: 10)
                
                Text("150")
                    .font(.system(size: 9, weight: .regular))
                    .foregroundColor(Color("categoryTextFg"))
            }
            
            HStack {
                Image("love")
                    .resizable()
                    .frame(width: 11, height: 10)
                
                Text("950")
                    .font(.system(size: 9, weight: .regular))
                    .foregroundColor(Color("categoryTextFg"))
            }
            Spacer()
        }
    }
}

struct StoryThumbnailFullDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryThumbnailFullDetailView(story: SampleData.stories()[0], thumbnailHeight: 150)
            .frame(height: 150)
    }
}
