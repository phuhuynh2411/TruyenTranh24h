//
//  SlideThumbnail.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 15/04/2021.
//

import SwiftUI

struct CarouselItemlView: View {
    @State var item: Carousel
    
    var body: some View {
        GeometryReader { geo in
            RemoteImage(stringURL: item.stringURL)
                .frame(width: geo.size.width, height: 190)
                .background(Color.secondary)
        }
    }
}

struct CarouselItemlView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselItemlView(item: SampleData.carousels()[0])
    }
}
