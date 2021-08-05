//
//  Home.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 23/04/2021.
//

import SwiftUI
import RefreshableScrollView
import CarouselView
import UIKit

struct HomeView: View {
    @ObservedObject var viewModel: HomeModel
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
                
                Button(action: {}, label: {
                    NavigationLink(
                        destination: SearchStoryView()) {
                        SearchFieldView(textValue: $viewModel.searchValue, disable: true)
                    }
                })

            }
            .padding(EdgeInsets(top: 0, leading: self.padding, bottom: 0, trailing: self.padding))
    }
    
    fileprivate func suggestedMightLikeViews() -> some View {
        return Group {
            // Suggested stories
            Commic2ColumnView(stories: SampleData.stories(), title: "suggested-story", thumbnailHeight: 132.0)
            
            // You might like story section
            Commic2ColumnView(stories: SampleData.stories(), title: "you-might-like", thumbnailHeight: 132.0)
        }
        .padding(EdgeInsets(top: 0, leading: self.padding, bottom: 0, trailing: self.padding))
    }
    
    var body: some View {
        NavigationView {
            RefreshableScrollView(refreshing: $viewModel.refresh, action: {
                // add your code here
                // remmber to set the refresh to false
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewModel.refresh = false
                }
            }) {
                VStack(spacing: 20) {
                    // Top views
                    topViews()
                        .padding(.top)

                    // Carousel view
                    CarouselView(items: SampleData.carousels(),
                                 slideIndicator: false,
                                 height: 130,
                                 isFullWidth: false)

                    // Category view
                    HorizontalCategoryView(categories: SampleData.categories())

                    // Suggested and Might like views
                    suggestedMightLikeViews()

                    // Hot view
                    HotView(stories: SampleData.stories(), title: "very-hot")
                        .offset(x: self.padding)

                    // Trailer stories
                    TrailerView(stories: SampleData.stories(), title: "comming-soon-title")

                    // Daily update
                    Commic2ColumnView(stories: SampleData.stories(), title: "daily-update", thumbnailHeight: 132.0)
                        .padding(EdgeInsets(top: 0, leading: self.padding, bottom: 0, trailing: self.padding))
                }
                .padding(.bottom, 16)
            }
           
            .navigationBarHidden(true)
        }
        .accentColor( .black)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeModel())
    }
}
