//
//  FollowView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI

struct FollowView: View {
    @State var stories: [Story]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("follow")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black)
                
                Spacer()
            }
            .frame(height: 50)
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading) {
                    
                    ForEach(stories) { story in
                        StoryThumbnailFullDetailView(story: story, thumbnailHeight: 132)
                    }
                    
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                // navigation settings
                .navigationBarHidden(true)
            }
        }
    }
}

struct FollowView_Previews: PreviewProvider {
    static var previews: some View {
        FollowView(stories: SampleData.stories())
    }
}
