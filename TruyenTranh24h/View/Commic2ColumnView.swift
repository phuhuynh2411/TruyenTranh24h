//
//  TopCommic.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI

struct Commic2ColumnView: View {
    @State var stories: [Story]
    @State var title: String? = nil
    @State var thumbnailHeight: CGFloat? = nil
    @State var moreButton = true
    
    @State var pressOnMoreButton = false
    private let thumbnailWidth: CGFloat = UIScreen.main.bounds.width/2 - 16
    
    @State private var showStoryDetail = false
    
    var body: some View {
        let column1Stories = stories.prefix(stories.count/2)
        let column2Stories = stories.suffix(from: stories.count/2)
        
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
                }
                
                // grid of image
                HStack {
                    VStack {
                        ForEach(column1Stories) { story in
                            StoryCellView(story: story, height: thumbnailHeight)
                        }
                    }
                    .frame(width: thumbnailWidth)
                    
                    VStack {
                        ForEach(column2Stories) { story in
                            StoryCellView(story: story, height: thumbnailHeight)
                        }
                    }
                    .frame(width: thumbnailWidth)
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
                }
            }
        }
    }
    
    struct StoryCellView: View {
        @State private var showStoryDetail = false
        @State var story: Story
        @State var height: CGFloat?
        
        var body: some View {
            Button(action: {
                showStoryDetail.toggle()
            }, label: {
                StoryThumbnailView(story: story, thumbnailHeight: height)
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
    static var previews: some View {
        Commic2ColumnView(stories: SampleData.stories(), title: "Top commic")
    }
}
