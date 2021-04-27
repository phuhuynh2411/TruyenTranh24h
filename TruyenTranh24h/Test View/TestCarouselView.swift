//
//  TestCarouselView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 27/04/2021.
//

import SwiftUI
import CarouselView


struct TestCarouselView: View {
    let items = [
                Carousel(id: 1, stringURL: "https://raw.githubusercontent.com/phuhuynh2411/CarouselView/be9fad4af1c1776d815e633195fcd19e9894287e/bong_toi.jpg"),
                 Carousel(id: 2, stringURL: "https://raw.githubusercontent.com/phuhuynh2411/CarouselView/main/fairytail.jpg"),
                 Carousel(id: 3, stringURL: "https://github.com/phuhuynh2411/CarouselView/blob/main/one_piece.jpg?raw=true"),
                 Carousel(id: 4, stringURL: "https://github.com/phuhuynh2411/CarouselView/blob/main/one_punch_man.jpg?raw=true"),
                ]
    
    var body: some View {
        CarouselView(items: self.items)
    }
}

struct TestCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        TestCarouselView()
    }
}
