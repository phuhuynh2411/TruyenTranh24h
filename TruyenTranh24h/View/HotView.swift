//
//  HotView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 04/06/2021.
//

import SwiftUI

struct HotView: View {
    var stories: [Story]
    var hotViewSize = CGSize(width: 118, height: 176)
    var title: String? = nil
    var showPlaceholder = false
    
    var placeholders: [Story] = {
        var stories: [Story] = []
        (0..<10).forEach {
            stories.append(Story.placeholder(id: $0))
        }
        return stories
    }()
    
    var body: some View {
        VStack {
            // Title
            if let t = title {
                HStack {
                    Text(LocalizedStringKey(t))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("mainTitleText"))
                        .font(.system(size: 14, weight: .medium))
                    
                    Spacer()
                }
                .padding(.leading, 16)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                // list of horizontal images
                let count = showPlaceholder ? placeholders.count : stories.count
                LazyHStack {
                    ForEach(0..<count, id: \.self) { i in
                        let s = showPlaceholder ? placeholders[i] : stories[i]
                        StoryThumbnailView(story: s)
                            .frame(width: hotViewSize.width, height: hotViewSize.height)
                    }
                }
                .padding([.leading, .trailing], 16)
                .redacted(reason: showPlaceholder ? .placeholder : [])
            }
        }
    }
}

struct HotView_Previews: PreviewProvider {
    @State static var stories = SampleData.stories()
    
    static var previews: some View {
        HotView(stories: stories, title: "very-hot")
            
    }
}
