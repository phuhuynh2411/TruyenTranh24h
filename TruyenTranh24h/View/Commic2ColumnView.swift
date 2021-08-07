//
//  TopCommic.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI

struct Commic2ColumnView: View {
    @Binding var stories: [Story]
    @State var title: String? = nil
    @State var thumbnailHeight: CGFloat? = nil
    @State var moreButton = true
    
    @State var pressOnMoreButton = false
    
    @State private var showStoryDetail = false
    @State private var placeholders: [Story] = {
        var stories: [Story] = []
        for i in 0..<6 {
            stories.append(Story.placeholder(id: i))
        }
        return stories
    }()
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10, alignment: .center), count: 2)
    
    var body: some View {
        
        VStack {
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
                    .unredacted()
                }
                let count = stories.count > 0 ? stories.count : placeholders.count
                LazyVGrid(columns: columns){
                    ForEach(0..<count, id: \.self)  { i in
                        StoryCellView(story: stories.count > 0 ? $stories[i] : $placeholders[i], height: thumbnailHeight)
                            .disabled(stories.count == 0)
                    }
                }
                
                // See more button
                if moreButton {
                    Button(action: {
                        self.pressOnMoreButton = true
                    }) {
                        NavigationLink(destination: ViewMoreView(), isActive: $pressOnMoreButton) {
                            Text("see-more")
                                .frame(width: 85, height: 26)
                                .font(.system(size: 10, weight: .light))
                                .background(Color("seeMoreButtonBg"))
                                .foregroundColor(Color("seeMoreButtonFg"))
                                .cornerRadius(13.0)
                                
                        }
                        .navigationBarTitleDisplayMode(.inline)
                        
                    }
                    .padding(.top, 10)
                }
            }
        }
        .redacted(reason: stories.count > 0 ? [] : .placeholder)

    }
    
    struct StoryCellView: View {
        @State private var showStoryDetail = false
        @Binding var story: Story
        @State var height: CGFloat?
        @State var width: CGFloat?
        
        var body: some View {
            Button(action: {
                showStoryDetail.toggle()
            }, label: {
                StoryThumbnailView(story: $story)
                    .frame(height: height, alignment: .center)
            })
            .buttonStyle(PlainButtonStyle())
            
            .fullScreenCover(isPresented: $showStoryDetail, content: {
                NavigationView {
                    StoryView(story: story)
                }
            })
        }
    }
}

struct TopCommic_Previews: PreviewProvider {
    @State static var stories = SampleData.stories()
    
    static var previews: some View {
        Commic2ColumnView(stories: $stories, title: "Top commic")
    }
}
