//
//  TrailerViewItem.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 10/06/2021.
//

import SwiftUI
import RemoteImageView

struct TrailerViewItem: View {
    @State var story: Story
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            RemoteImageView(stringURL: story.featureImage)
                .frame(height: 136)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(7.0)
            
            // Story name
            HStack {
                Text(story.title)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 11, weight: .medium))
                    .frame(height: 15, alignment: .top)
                
                Spacer()
            }
            
            HStack {
                // last update
                Text("comming-soon \(story.createdAt)")
                    .foregroundColor(Color("trailerDescriptionTextFg"))
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 8, weight: .light))
                    .frame(height: 10, alignment: .top)
                
                Spacer()
            }
        }
    }
}

struct TrailerViewItem_Previews: PreviewProvider {
    static var previews: some View {
        TrailerViewItem(story: SampleData.stories()[0])
    }
}
