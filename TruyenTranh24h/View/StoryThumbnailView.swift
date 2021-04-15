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
                    .cornerRadius(5.0)
                
                
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
                    
                    // Hot button
                    // Only Hot button when the story is hot
                    if story.isHot {
                        Text("hot-title")
                            .padding(2)
                            .foregroundColor(Color("hotButtonFg"))
                            .background(Color("hotButtonBg"))
                            .cornerRadius(3.0)
                            .padding(5)
                            .font(.system(size: 12))
                            .opacity(aniHot ? 0 : 1)
                            // add blink effect to the hot button
                            .animation(Animation.easeInOut.repeatForever(autoreverses: true))
                            .onAppear {
                                aniHot = true
                            }
                            // when adding the thumbnail to the gid, we will need to reset the aniHot to false
                            // otherwise, the animation will be stopped.
                            .onDisappear {
                                aniHot = false
                            }
                    }
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
