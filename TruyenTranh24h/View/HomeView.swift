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
    
    fileprivate func topViews() -> some View {
        return // Search box
            HStack {
                // left button
                Button(action: {}){
                    Image("rank")
                        .resizable()
                        .frame(width: 13, height: 13)
                }
                
                SearchFieldView(textValue: $searchValue)
            }
            .padding(EdgeInsets(top: 0, leading: self.padding, bottom: 0, trailing: self.padding))
    }
    
    fileprivate func suggestedMightLikeViews() -> some View {
        return Group {
            // Suggested stories
            CommicView(stories: SampleData.stories(), numberOfColumns: 2, title: "suggested-story", thumbnailHeight: 132.0)
            
            // You might like story section
            CommicView(stories: SampleData.stories(), numberOfColumns: 2, title: "you-might-like", thumbnailHeight: 132.0)
        }
        .padding(EdgeInsets(top: 0, leading: self.padding, bottom: 0, trailing: self.padding))
    }
    
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
                    // Top views
                    topViews()
                    
                    // Carousel view
                    CarouselView(items: SampleData.carousels(),
                                 slideIndicator: false,
                                 height: 130,
                                 isFullWidth: false)
                    
                    // Category view
                    HorizontalCategoryView(categories: SampleData.categories())
                    
                    // Bottom views
                    suggestedMightLikeViews()
                    
                    // Hot view
                    HotView(stories: SampleData.stories(), title: "very-hot")
                        .offset(x: self.padding)
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
