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
    @State var searchValue: String = ""
    private let padding:CGFloat = 16.0
    
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
                    // Search box
                    HStack {
                        // left button
                        Button(action: {}){
                            Image("rank")
                                .resizable()
                                .frame(width: 13, height: 13)
                        }
                        
                        SearchFieldView(textValue: $searchValue)
                    }
                    .padding(self.padding)
                    
                    // Carousel view
                    CarouselView(items: SampleData.carousels(),
                                 slideIndicator: false,
                                 height: 130,
                                 isFullWidth: false)
                    
                    HorizontalCategoryView(categories: SampleData.categories())
                    
                    CommicView(stories: SampleData.stories(), numberOfColumns: 2, title: "suggested-story", thumbnailHeight: 132.0)
                        .padding(self.padding)
                
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
