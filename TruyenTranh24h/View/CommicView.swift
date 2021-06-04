//
//  TopCommic.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI

struct CommicView: View {
    @State var stories: [Story]
    @State var numberOfColumns = 2
    @State var title: String? = nil
    @State var thumbnailHeight: CGFloat? = nil
    
    var body: some View {
        VStack{
            // Story thumbnails
            let columns: [GridItem] =
                Array(repeating: .init(.flexible()), count: numberOfColumns)
            ScrollView {
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
                    LazyVGrid(columns: columns) {
                        ForEach(stories) { story in
                            NavigationLink(destination: StoryView(story: story)) {
                                StoryThumbnailView(story: story, thumbnailHeight: self.thumbnailHeight)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                        }
                    }
                }
            }
        }
    }
}

struct TopCommic_Previews: PreviewProvider {
    static var previews: some View {
        CommicView(stories: SampleData.stories(), title: "Top commic")
    }
}
