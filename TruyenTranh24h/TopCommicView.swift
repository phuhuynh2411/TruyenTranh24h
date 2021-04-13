//
//  TopCommic.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI

struct TopCommicView: View {
    let stories = [StoryThumbnailView(), StoryThumbnailView(), StoryThumbnailView()]
    
    var body: some View {
        VStack{
            // Title
            
            Text("Top commics")
            
            // Story thumbnails
            
        }
    }
}

struct TopCommic_Previews: PreviewProvider {
    static var previews: some View {
        TopCommicView()
    }
}
