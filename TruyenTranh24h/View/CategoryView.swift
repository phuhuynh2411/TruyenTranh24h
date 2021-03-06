//
//  CategoryView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI
import UIKit
import RefreshableScrollView
import AlertToast

struct CategoryView: View {
    @ObservedObject var viewModel: CategoryModel
    
    @State var placeholders: [Story] = {
        var stories: [Story] = []
        (0..<10).forEach { i in
            stories.append(Story.placeholder(id: i))
        }
        return stories
    }()
    
    var categoryPlaceholders: [Category] = {
        var categories: [Category] = []
        (0..<10).forEach { i in
            categories.append(Category.placeholder(id: i))
        }
        return categories
    }()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if let categories = viewModel.categories {
                HorizontalCategorySimpleView(categories: categories, selectedCategory: $viewModel.selectedCategory)
                    .frame(height: 50)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
            } else {
                HorizontalCategorySimpleView(categories: categoryPlaceholders, selectedCategory: $viewModel.selectedCategory)
                    .frame(height: 50)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .redacted(reason: .placeholder)
            }
            
            //search field
            SearchFieldView(textValue: $viewModel.searchValue)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            
            RefreshableScrollView(refreshing: $viewModel.isRefreshing, action: {
                viewModel.refetchData()
            }) {
                LazyVStack {
                    if let stories = viewModel.stories {
                        listStoryView(stories: stories)
                    } else {
                        listStoryView(stories: placeholders)
                            .redacted(reason: .placeholder)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
        }
        
        // navigation settings
        .navigationBarHidden(true)
        .toast(isPresenting: $viewModel.isError) {
            AlertToast(type: .regular, title: "Error", subTitle: viewModel.error?.localizedDescription)
        }
        
    }
    
    func listStoryView(stories: [Story]) -> some View {
        ForEach(stories) { story in
            StoryCellView(story: story, height: 132)
                .onAppear {
                    if story == stories.suffix(3).first {
                        viewModel.loadMoreStory()
                    }
                }
        }
    }
    
    struct StoryCellView: View {
        @State private var showStoryDetail = false
        @EnvironmentObject var viewModel: CategoryModel
        
        var story: Story
        var height: CGFloat?
        
        var body: some View {
            Button(action: {
                showStoryDetail.toggle()
            }, label: {
                StoryThumbnailFullDetailView(story: story)
                    .frame(height: height, alignment: .center)
                    
            })
            .buttonStyle(PlainButtonStyle())
            
            .fullScreenCover(isPresented: $showStoryDetail, content: {
                NavigationView {
                    StoryView().environmentObject(StoryViewModel(story: story))
                }
            })
        }
    }
    
    struct CategoryView_Previews: PreviewProvider {
        static var previews: some View {
            CategoryView(viewModel: CategoryModel())
        }
    }
}
