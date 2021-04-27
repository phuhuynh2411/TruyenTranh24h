//
//  TestCarouselView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 27/04/2021.
//

import SwiftUI
import CarouselView


struct TestCarouselView: View {
    var body: some View {
        CarouselView(items: SampleData.carousels())
    }
}

struct TestCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        TestCarouselView()
    }
}
