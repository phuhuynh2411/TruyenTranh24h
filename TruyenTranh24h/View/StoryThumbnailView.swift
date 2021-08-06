//
//  StoryThumbnail.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI
import Kingfisher

struct StoryThumbnailView: View {
    @Binding var story: Story
    private let textHeight: CGFloat = 40
    @State var isLoaded = false
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let imageHeight = proxy.size.height - textHeight > 0 ? proxy.size.height - textHeight : 10

                VStack(alignment: .center, spacing: 10) {
                    ZStack {
                        KFImage(URL(string: story.imageURLString)!, isLoaded: $isLoaded)
                            .scaledToFill()
                            .frame(width: proxy.size.width, height: imageHeight )
                            .clipped()
                            .cornerRadius(7.0)
                        if !isLoaded {
                            Image("image_placeholder")
                                .frame(width: 60, height: 60 )
                                .cornerRadius(7.0)
                            
                        }
                    }
                    
                    // Story name
                    Text(story.title)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 11, weight: .medium))
                        .frame(height: textHeight, alignment: .top)
                }
            }
        }
        
        
    }
}

struct StoryThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            HStack {
//                StoryThumbnailView(story: SampleData.stories()[0])
//                    .environment(\.locale, .init(identifier: "us"))
//                    .frame(width: 109, height: 168)
//
//                StoryThumbnailView(story: SampleData.stories()[1])
//                    .environment(\.locale, .init(identifier: "us"))
//                    .frame(width: 109, height: 168)
//
//                StoryThumbnailView(story: SampleData.stories()[2])
//                    .environment(\.locale, .init(identifier: "us"))
//                    .frame(width: 109, height: 168)
//            }
            
            // hot story
//            HStack {
//                StoryThumbnailView(story: SampleData.stories()[1])
//                    .environment(\.locale, .init(identifier: "vi"))
//                    .frame(width: 250, height: 100)
//                    .background(Color.green)
//                
//                StoryThumbnailView(story: SampleData.stories()[1])
//                    .environment(\.locale, .init(identifier: "vi"))
//                    .frame(width: 250, height: 100)
//                    .background(Color.green)
//            }
            
        }
    }
}
