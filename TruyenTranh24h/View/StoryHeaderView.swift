//
//  StoryHeaderView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 14/06/2021.
//

import SwiftUI
import RemoteImageView

struct StoryHeaderView: View {
    @State var story: Story
    
    var body: some View {
        HStack {
            // thumbnail
            RemoteImageView(stringURL: story.featureImage)
                .scaledToFit()
                .frame(width: 91, height: 109)
                .clipped()
                .cornerRadius(7.0)
            
            VStack (alignment: .leading){
                Text(story.title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
            }
        }
        .background(self.background)
    }
    
    var background: some View {
        RemoteImageView(stringURL: story.featureImage)
            .scaledToFill()
            .frame(width: UIScreen.main.bounds.width, height: 200)
            .clipped()
            .background(Color.black)
            .blur(radius: 20.0, opaque: true)
        
    }
}

struct StoryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StoryHeaderView(story: SampleData.stories()[1])
            .frame(height: 200)
    }
}
