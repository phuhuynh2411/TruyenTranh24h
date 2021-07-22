//
//  ListStoryThumbnailView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 22/07/2021.
//

import SwiftUI
import RemoteImageView

struct ListStoryThumbnailView: View {
    @State var story: Story
    @State var thumbnailHeight: CGFloat? = nil
    
    var body: some View {
        RemoteImageView(stringURL: story.featureImage)
            .scaledToFill()
            .frame(height: thumbnailHeight)
            .clipped()
            .cornerRadius(7.0)
    }
}

struct ListStoryThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        ListStoryThumbnailView(story: SampleData.stories()[0])
    }
}
