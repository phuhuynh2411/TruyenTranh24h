//
//  StoryView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 27/04/2021.
//

import SwiftUI
import RemoteImageView

struct StoryView: View {
    @State var story: Story
    
    var body: some View {
        ScrollView {
            VStack {
                // Title
                Text(story.title)
                
                // Thumbnail
                RemoteImageView(stringURL: story.featureImage)
                
                // Description
                Text(story.description)
                
                // Comments
                CommentView(comments: SampleData.comments())
            }
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var story: Story {
        var temp: Story = SampleData.stories()[0]
        temp.featureImage = "\(URLSetting.baseURL)\(temp.featureImage)"
        
        return temp
    }
    
    static var previews: some View {
        StoryView(story: story)
    }
}
