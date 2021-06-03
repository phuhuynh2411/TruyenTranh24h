//
//  StoryThumbnail.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI

struct StoryThumbnailView: View {
    @State var story: Story
    @State var aniHot = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                Image("trongsinh_thumbnail")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(7.0)
                
                
                // Top buttoms
                HStack() {
                    // Chapter
                    Text(story.lastChapter.title)
                        .padding(2)
                        .foregroundColor(Color("chapterButtonFg"))
                        .background(Color("chapterButtonBg"))
                        .cornerRadius(3.0)
                        .padding(5)
                        .font(.system(size: 12))
                    
                    // Add space
                    Spacer()
                }
            }
            
            // Story name
            Text("Trọng sinh ta sau tám vạn năm")
                .multilineTextAlignment(.center)
                .font(.system(size: 12))
            
        }
        
        
    }
}

struct StoryThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//            StoryThumbnailView(story: SampleData.stories()[0])
//                .environment(\.locale, .init(identifier: "us"))
            
            // hot story
            StoryThumbnailView(story: SampleData.stories()[1])
                .environment(\.locale, .init(identifier: "vi"))
        }
    }
}
