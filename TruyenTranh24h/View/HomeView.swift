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
import AlertToast

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
            CommicView(stories: viewModel.recommendStories, title: "suggested-story", thumbnailHeight: 132.0, showPlaceholder: viewModel.recommendStories == nil)
            
            // You might like story section
            CommicView(stories: viewModel.maybeYouLikeStories, title: "you-might-like", thumbnailHeight: 132.0, showPlaceholder: viewModel.maybeYouLikeStories == nil)
        }
        .padding(EdgeInsets(top: 0, leading: self.padding, bottom: 0, trailing: self.padding))
    }
    
    var body: some View {
        NavigationView {
            RefreshableScrollView(refreshing: $viewModel.refresh, action: {
                viewModel.fetchData()
            }) {
                VStack(spacing: 20) {
                    topViews()
                        .padding(.top)
                    
                    // Carousel view
                    SnapCarousel(stories: viewModel.featureStories,
                                 showPlaceholder: viewModel.featureStories == nil).environmentObject(UIStateModel())
                        .frame(height: 130)
                        .zIndex(1) // move to top
                    
                    // Category view
                    HorizontalCategoryView(categories: viewModel.categories ?? [], showPlaceholder: viewModel.categories == nil)
                    
                    // Suggested and Might like views
                    suggestedMightLikeViews()
                    
                    // Hot view
                    HotView(stories: viewModel.hotStories ?? [], title: "very-hot", showPlaceholder: viewModel.hotStories == nil)
                    
                    // Trailer stories
                    //TrailerView(stories: $viewModel.trailerStories, title: "comming-soon-title")
                    
                    // Daily update
                    CommicView(stories: viewModel.dailyUpdateStories,
                                      title: "daily-update",
                                      thumbnailHeight: 132.0,
                                      showPlaceholder: viewModel.dailyUpdateStories == nil)
                        .padding(EdgeInsets(top: 0, leading: self.padding, bottom: 0, trailing: self.padding))
                }
                .padding(.bottom, 16)
            }
            .navigationBarHidden(true)
        }
        .accentColor( .black)
        // Handel error
        .toast(isPresenting: $viewModel.isError) {
            AlertToast(type: .regular, title: "Error", subTitle: viewModel.error?.localizedDescription)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeModel())
    }
}
