//
//  TopCommic.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI

struct Commic2ColumnView: View {
    var stories: [Story]?
    var title: String? = nil
    var thumbnailHeight: CGFloat? = nil
    var moreButton = true
    
    @State var pressOnMoreButton = false
    
    var showStoryDetail = false
    var placeholders: [Story] = {
        var stories: [Story] = []
        for i in -6..<0 {
            stories.append(Story.placeholder(id: i))
        }
        return stories
    }()
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10, alignment: .center), count: 2)
    var showPlaceholder = false
    
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
                .unredacted()
            }
            
            LazyVGrid(columns: columns){
                storyView(stories: showPlaceholder ? placeholders : stories ?? [])
            }
            
            // See more button
            if moreButton {
                moreButtonView
            }
        }
        .redacted(reason: showPlaceholder ? .placeholder : [])
    }
    
    var moreButtonView: some View {
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
    
    private func storyView(stories: [Story]) -> some View{
        ForEach(stories)  { story in
            StoryCellView(story: story, height: thumbnailHeight)
                .disabled(stories.count == 0)
        }
    }
    
    struct StoryCellView: View {
        @State private var showStoryDetail = false
        var story: Story
        var height: CGFloat?
        var width: CGFloat?
        
        var body: some View {
            Button(action: {
                showStoryDetail.toggle()
            }, label: {
                StoryThumbnailView(story: story)
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
        Commic2ColumnView(stories: stories)
    }
}
