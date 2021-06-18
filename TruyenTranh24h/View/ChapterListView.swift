//
//  ChapterListView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 18/06/2021.
//

import SwiftUI

struct ChapterListView: View {
    @State var chapters: [Chapter]
    
    var body: some View {
        VStack {
            ForEach(chapters){ chapter in
                ChapterItemView(chapter: chapter)
                    .frame(height: 40)
            }
        }
    }
}

struct ChapterListView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterListView(chapters: SampleData.chapters())
    }
}
