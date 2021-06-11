//
//  TrailerView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 10/06/2021.
//

import SwiftUI

struct TrailerView: View {
    @State var stories: [Story]
    @State var title: String?
    
    let itemWidth = UIScreen.main.bounds.width * 90/100
    
    var body: some View {
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
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(stories) { story in
                        TrailerViewItem(story: story)
                            .frame(width: itemWidth)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
            }
        }
    }
}

struct TrailerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerView(stories: SampleData.stories(), title: "New trailer stories")
    }
}
