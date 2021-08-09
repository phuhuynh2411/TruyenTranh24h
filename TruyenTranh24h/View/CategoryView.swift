//
//  CategoryView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI
import UIKit

struct CategoryView: View {
    @ObservedObject var viewModel: CategoryModel
    
    @State var placeholders: [Story] = {
        var stories: [Story] = []
        (0..<10).forEach { i in
            stories.append(Story.placeholder(id: i))
        }
        return stories
    }()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if let categories = viewModel.categories {
                HorizontalCategorySimpleView(categories: categories, selectedCategory: $viewModel.selectedCategory)
                    .frame(height: 50)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))

            }
            
            //search field
            SearchFieldView(textValue: $viewModel.searchValue)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            
            ScrollView {
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
        
    }
    
    func listStoryView(stories: [Story]) -> some View {
        ForEach(stories) { story in
            StoryThumbnailFullDetailView(story: story)
                .frame(height: 132)
                .onAppear {
                    if story == stories.suffix(3).first {
                        viewModel.loadMoreStory()
                    }
                }
        }
    }
    
    struct CategoryView_Previews: PreviewProvider {
        static var previews: some View {
            CategoryView(viewModel: CategoryModel())
        }
    }
}
