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
            if let recommendStories = viewModel.recommendStories {
                Commic2ColumnView(stories: recommendStories, title: "suggested-story", thumbnailHeight: 132.0)
            }
            
            // You might like story section
            if let maybeYouLikeStories = viewModel.maybeYouLikeStories {
                Commic2ColumnView(stories: maybeYouLikeStories, title: "you-might-like", thumbnailHeight: 132.0)
            }
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
                    if let carouselItems = viewModel.carouselItems {
                        CarouselView(items: carouselItems,
                                     slideIndicator: false,
                                     height: 130,
                                     isFullWidth: false)
                    }

                    // Category view
                    HorizontalCategoryView(categories: SampleData.categories())

                    // Suggested and Might like views
                    suggestedMightLikeViews()

                    // Hot view
                    if let hotStories = viewModel.hotStories {
                        HotView(stories: hotStories, title: "very-hot")
                            .offset(x: self.padding)
                    }

                    // Trailer stories
                    if let trailerStories = viewModel.trailerStories, trailerStories.count > 0 {
                        TrailerView(stories: trailerStories, title: "comming-soon-title")
                    }

                    // Daily update
                    if let dailyUpdateStories = viewModel.dailyUpdateStories {
                        Commic2ColumnView(stories: dailyUpdateStories, title: "daily-update", thumbnailHeight: 132.0)
                            .padding(EdgeInsets(top: 0, leading: self.padding, bottom: 0, trailing: self.padding))
                    }
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
