//
//  ChapterItemView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 18/06/2021.
//

import SwiftUI

struct ChapterItemView: View {
    @State var chapter: Chapter
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            HStack {
                Text(chapter.title)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.black)
                
                Spacer()
                
                Text(chapter.formattedRelasedDate)
                    .font(.system(size: 10, weight: .light))
                    .foregroundColor(Color("dateChaperItemFg"))
            }
            Spacer()
            
            //LineView()
        }
        
    }
}

struct ChapterItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterItemView(chapter: SampleData.chapters()[0])
            .frame(height: 40)
    }
}
