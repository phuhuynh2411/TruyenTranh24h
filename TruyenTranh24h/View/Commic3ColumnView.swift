//
//  Commic3ColumnView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 11/06/2021.
//

import SwiftUI

struct Commic3ColumnView: View {
    @State var stories: [Story]
    @State var title: String? = nil
    @State var thumbnailHeight: CGFloat? = nil
    @State var moreButton: Bool = true
    
    private let screenWidth = UIScreen.main.bounds.width
    private let thumbnailWidth: CGFloat = UIScreen.main.bounds.width/3 - (52/3)
    
    var body: some View {
        let n = stories.count
        let c3 = n / 3
        let c2 = (n - c3) / 2
        let c1 = n - c2 - c3
        
        let column3Stories = stories.suffix(c3)
        let column2Stories = stories[c1...c1+c2]
        let column1Stories = stories.prefix(c1)
        
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
            HStack(alignment: .top, spacing: 10) {
                VStack {
                    ForEach(column1Stories) { story in
                        NavigationLink(destination: StoryView(story: story)) {
                            StoryThumbnailView(story: story, thumbnailHeight: self.thumbnailHeight)
                                //.frame(width: thumbnailWidth, height: 168)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .frame(width: thumbnailWidth)
                
                //.background(Color.red)
                
                
                VStack {
                    ForEach(column2Stories) { story in
                        NavigationLink(destination: StoryView(story: story)) {
                            StoryThumbnailView(story: story, thumbnailHeight: self.thumbnailHeight)
                                //.frame(width: thumbnailWidth, height: 168)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .frame(width: thumbnailWidth)
                //.background(Color.blue)
                
                
                VStack {
                    ForEach(column3Stories) { story in
                        NavigationLink(destination: StoryView(story: story)) {
                            StoryThumbnailView(story: story, thumbnailHeight: self.thumbnailHeight)
                                //.frame(width: thumbnailWidth, height: 168)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .frame(width: thumbnailWidth)
                //.background(Color.green)
            }
            
            // See more button
            if moreButton {
                Button(action: {}) {
                    Text("see-more")
                        .frame(width: 85, height: 26)
                        .font(.system(size: 10, weight: .light))
                        .background(Color("seeMoreButtonBg"))
                        .foregroundColor(Color("seeMoreButtonFg"))
                        .cornerRadius(13.0)
                }
            }
        }
    }
}

struct Commic3ColumnView_Previews: PreviewProvider {
    static var previews: some View {
        Commic3ColumnView(stories: SampleData.stories(), title: "Top commic", thumbnailHeight: 130)
    }
}
