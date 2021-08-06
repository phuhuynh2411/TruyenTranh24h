//
//  HotView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 04/06/2021.
//

import SwiftUI

struct HotView: View {
    @Binding var stories: [Story]
    @State var hotViewSize = CGSize(width: 118, height: 176)
    @State var title: String? = nil
    
    @State private var placeholders: [Story] = {
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
                let count = stories.count > 0 ? stories.count : placeholders.count
                LazyHStack {
                    ForEach(0..<count, id: \.self) { i in
                        StoryThumbnailView(story: stories.count > 0 ? $stories[i] : $placeholders[i])
                            .frame(width: hotViewSize.width, height: hotViewSize.height)
                    }
                }
                .padding([.leading, .trailing], 16)
                .redacted(reason: stories.count > 0 ? [] : .placeholder)
            }
        }
    }
}

struct HotView_Previews: PreviewProvider {
    @State static var stories = SampleData.stories()
    
    static var previews: some View {
        HotView(stories: $stories, title: "very-hot")
            
    }
}
