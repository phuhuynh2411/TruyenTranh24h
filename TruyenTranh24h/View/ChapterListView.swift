//
//  ChapterListView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 18/06/2021.
//

import SwiftUI

struct ChapterListView: View {
    @State var chapters: [Chapter]
    @State private var selectedFilter: ChapterFilter = .newest
    
    var body: some View {
        VStack {
            HStack {
                Text("Updated to chapter 102")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.black)
                
                Spacer()
                
                HStack(spacing: 16) {
                    Button(action: {}, label: {
                        Text("newest")
                            .font(.system(size: 10, weight: .light))
                            .foregroundColor(selectedFilter == .newest ? Color("mainTitleText") : Color("dateChaperItemFg"))
                    })
                   
                    Text("|")
                        .font(.system(size: 10, weight: .light))
                        .foregroundColor(Color("dateChaperItemFg"))
                    
                    Button(action: {}, label: {
                        Text("oldest")
                            .font(.system(size: 10, weight: .light))
                            .foregroundColor(selectedFilter == .oldest ? Color("mainTitleText") : Color("dateChaperItemFg"))
                    })
                }
            }
            .padding(EdgeInsets(top: 25, leading: 16, bottom: 25, trailing: 16))
            
            ForEach(chapters){ chapter in
                ChapterItemView(chapter: chapter)
                    .frame(height: 50)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                
                LineView()
            }
        }
    }
    
    enum ChapterFilter {
        case newest
        case oldest
    }
}

struct ChapterListView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterListView(chapters: SampleData.chapters())
    }
}
