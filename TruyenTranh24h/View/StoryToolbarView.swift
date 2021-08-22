//
//  StoryToolbarView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 18/06/2021.
//

import SwiftUI

struct StoryToolbarView: View {
    @Binding var story: Story
    
    var body: some View {
        HStack {
            Button(action: {}, label: {
                VStack (spacing: 8) {
                    Image("share")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 14, height: 14)
                        .foregroundColor(Color("toolbarButtonFg"))
                    
                    Text("share")
                        .font(.system(size: 9, weight: .regular))
                        .foregroundColor(Color("storyToolbarItemsFg"))
                }
            })
            .frame(maxWidth: .infinity)
            
            Button(action: {}, label: {
                VStack (spacing: 8){
                    Image("like-1")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 14, height: 14)
                        .foregroundColor(Color("toolbarButtonFg"))
                    
                    Text("like")
                        .font(.system(size: 9, weight: .regular))
                        .foregroundColor(Color("storyToolbarItemsFg"))
                }
            })
            .frame(maxWidth: .infinity)
            
            Button(action: {}, label: {
                VStack (spacing: 8){
                    Image("follow")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 14, height: 14)
                        .foregroundColor(Color("toolbarButtonFg"))
                    
                    Text("follow")
                        .font(.system(size: 9, weight: .regular))
                        .foregroundColor(Color("storyToolbarItemsFg"))
                }
            })
            .frame(maxWidth: .infinity)
            
            readNowButtonView
        }
        .frame(maxWidth: .infinity)
    }
    
    var readNowButtonView: some View {
        Group {
            if let chapter = story.chapters?.first {
                Button(action: {
                    
                }, label: {
                    NavigationLink( destination: ReadStoryView().environmentObject(ReadStoryModel(chapter: chapter, story: story))){
                        VStack {
                            Spacer()
                            
                            Text("read-now")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        .frame(width: 150)
                        .background(Color("readNowBg"))
                        .cornerRadius(17)
                        .navigationBarHidden(true)
                        
                    }
                })
            }
        }
    }
}

struct StoryToolbarView_Previews: PreviewProvider {
    @State static var story = SampleData.stories()[0]
    
    static var previews: some View {
        StoryToolbarView(story: $story)
            .frame(height: 34)
    }
}
