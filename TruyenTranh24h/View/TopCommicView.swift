//
//  TopCommic.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI

struct TopCommicView: View {
    @State var stories: [Story]
    
    var body: some View {
        VStack{
            // Title
            Text("top-commic-title")
            
            // Story thumbnails
            let columns: [GridItem] =
                     Array(repeating: .init(.flexible()), count: 3)
             ScrollView {
                 LazyVGrid(columns: columns) {
                    ForEach(stories) { Story in
                        StoryThumbnailView(story: Story)
                    }
                 }
                 .padding(5)
             }
        }
    }
}

struct TopCommic_Previews: PreviewProvider {
    static var previews: some View {
        TopCommicView(stories: SampleData.stories())
    }
}
