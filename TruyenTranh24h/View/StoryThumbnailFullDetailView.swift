//
//  StoryThumbnailFullDetailView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 22/07/2021.
//

import SwiftUI
import RemoteImageView
import Kingfisher

struct StoryThumbnailFullDetailView: View {
    @State var story: Story
    @State var thumbnailHeight: CGFloat? = nil
    @State var imageLoaded = false
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                HStack (spacing: 20) {
                    imageView(proxy: proxy)
                    detailsView
                }
            }
        }
    }
    
    func imageView(proxy: GeometryProxy) -> some View {
        ZStack {
            KFImage(URL(string: story.imageURLString), isLoaded: $imageLoaded)
                .scaledToFill()
                .frame(width: 120, height: proxy.size.height)
                .clipped()
                .cornerRadius(7.0)
            
            if !imageLoaded {
                Image("image_placeholder")
                    .frame(width: 60, height: 60)
            }
        }
    }
    
    var detailsView: some View {
        VStack (spacing: 12){
            HStack {
                Text(story.title)
                    .font(.system(size: 13, weight: .medium))
                Spacer()
            }
            
            HStack {
                Text("author")
                Text(story.author)
                Spacer()
            }
            .font(.system(size: 12, weight: .regular))
            
            ViewLikeLoveView(story: $story)
            
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

private struct ViewLikeLoveView: View {
    @Binding var story: Story
    
    var body: some View {
        HStack (spacing: 20){
            // view
            HStack {
                Image("view")
                    .resizable()
                    .frame(width: 16, height: 9)
                    .foregroundColor(Color("categoryTextFg"))
                
                Text("\(story.totalViews)")
                    .font(.system(size: 9, weight: .regular))
                    .foregroundColor(Color("categoryTextFg"))
            }
            
            HStack {
                Image("like")
                    .resizable()
                    .frame(width: 12, height: 10)
                
                Text("\(story.totalLikes)")
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
    @State static var story = SampleData.stories()[0]
    static var previews: some View {
        StoryThumbnailFullDetailView(story: story)
            .frame(height: 150)
    }
}
