//
//  Home.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 23/04/2021.
//

import SwiftUI
import RefreshableScrollView
import CarouselView

struct HomeView: View {
    @State var refresh: Bool = false
    
    var body: some View {
        NavigationView {
            RefreshableScrollView(refreshing: $refresh, action: {
                // add your code here
                // remmber to set the refresh to false
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.refresh = false
                }
            }) {
                VStack(spacing: 10) {
                    CarouselView(items: SampleData.carousels(),
                                 slideIndicator: false,
                                 height: 130,
                                 isFullWidth: false)
                    
                    HorizontalCategoryView(categories: SampleData.categories())
                    
                    CommicView(stories: SampleData.stories())
                        .padding(16)
                }
                
            }
            
            // hide the navigation in home view
            .navigationBarHidden(true)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
