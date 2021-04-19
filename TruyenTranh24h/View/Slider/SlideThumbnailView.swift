//
//  SlideThumbnail.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 15/04/2021.
//

import SwiftUI

struct SlideThumbnailView: View {
    @State var story: Story
    
    var body: some View {
        GeometryReader { geo in
            Image(story.featureImage)
                .resizable()
                .frame(width: geo.size.width, height: 190)
        }
    }
}

struct SlideThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        SlideThumbnailView(story: SampleData.localStories()[0])
    }
}
