//
//  StoryThumbnail.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI
import RemoteImageView

struct StoryThumbnailView: View {
    @State var story: Story
    @State var thumbnailHeight: CGFloat? = nil
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            RemoteImageView(stringURL: story.featureImage)
                .frame(height: thumbnailHeight)
                //.aspectRatio(contentMode: .fill)
                .cornerRadius(7.0)
            
            // Story name
            Text(story.title)
                .multilineTextAlignment(.leading)
                .font(.system(size: 11, weight: .medium))
                .frame(height: 30, alignment: .top)
        }
        
    }
}

struct StoryThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HStack {
                StoryThumbnailView(story: SampleData.stories()[0])
                    .environment(\.locale, .init(identifier: "us"))
                    .frame(width: 109, height: 168)
                
                StoryThumbnailView(story: SampleData.stories()[1])
                    .environment(\.locale, .init(identifier: "us"))
                    .frame(width: 109, height: 168)
                
                StoryThumbnailView(story: SampleData.stories()[2])
                    .environment(\.locale, .init(identifier: "us"))
                    .frame(width: 109, height: 168)
            }
            
            // hot story
            StoryThumbnailView(story: SampleData.stories()[1])
                .environment(\.locale, .init(identifier: "vi"))
                .frame(width: 109, height: 168)
        }
    }
}
