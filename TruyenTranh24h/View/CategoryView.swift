//
//  CategoryView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI

struct CategoryView: View {
    @State var searchValue: String = ""
    @State var stories: [Story] = SampleData.stories()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                HorizontalCategorySimpleView(categories: SampleData.categories())
                    .frame(height: 50)
                
                //search field
                SearchFieldView(textValue: $searchValue)
                    .padding(.bottom)
                
                ForEach(stories) { story in
                    StoryThumbnailFullDetailView(story: story, thumbnailHeight: 132)
                }
                
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            // navigation settings
            .navigationBarHidden(true)
        }
    }
    
    struct CategoryView_Previews: PreviewProvider {
        static var previews: some View {
            CategoryView()
        }
    }
}
