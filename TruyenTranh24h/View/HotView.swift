//
//  HotView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 04/06/2021.
//

import SwiftUI

struct HotView: View {
    @State var stories: [Story]
    @State var hotViewSize = CGSize(width: 118, height: 176)
    @State var title: String? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
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
                
                // list of horizontal images
                LazyHStack(){
                    ForEach(stories) { story in
                        StoryThumbnailView(story: story, thumbnailHeight: 150)
                            .frame(width: hotViewSize.width, height: hotViewSize.height)
                    }
                }
            }
        }
    }
}

struct HotView_Previews: PreviewProvider {
    static var previews: some View {
        HotView(stories: SampleData.stories(), title: "very-hot")
            
    }
}
