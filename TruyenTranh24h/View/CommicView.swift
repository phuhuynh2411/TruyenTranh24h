//
//  TopCommic.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI

struct CommicView: View {
    @State var stories: [Story]
    
    var body: some View {
        VStack{
            // Story thumbnails
            let columns: [GridItem] =
                     Array(repeating: .init(.flexible()), count: 3)
             ScrollView {
                 LazyVGrid(columns: columns) {
                    ForEach(stories) { story in
                        NavigationLink(destination: StoryView(story: story)) {
                            StoryThumbnailView(story: story)
                        }
                        .buttonStyle(PlainButtonStyle())

                    }
                 }
             }
        }
    }
}

struct TopCommic_Previews: PreviewProvider {
    static var previews: some View {
        CommicView(stories: SampleData.stories())
    }
}
