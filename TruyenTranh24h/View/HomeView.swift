//
//  Home.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 23/04/2021.
//

import SwiftUI
import RefreshableScrollView

struct HomeView: View {
    @State var refresh: Bool = false
    
    var body: some View {
        RefreshableScrollView(refreshing: $refresh, action: {
            // add your code here
            // remmber to set the refresh to false
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.refresh = false
            }
        }) {
            Group {
                CarouselView(items: SampleData.carousels().compactMap { Carousel(id: $0.id, stringURL: "\(URLSetting.baseURL)\($0.stringURL)")})
                
                CarouselView(items: SampleData.carousels().compactMap { Carousel(id: $0.id, stringURL: "\(URLSetting.baseURL)\($0.stringURL)")})
                
                CarouselView(items: SampleData.carousels().compactMap { Carousel(id: $0.id, stringURL: "\(URLSetting.baseURL)\($0.stringURL)")})
            }
     
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
