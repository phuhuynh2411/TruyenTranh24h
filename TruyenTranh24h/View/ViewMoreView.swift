//
//  ViewMoreView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 11/06/2021.
//

import SwiftUI

struct ViewMoreView: View {
    @State var searchValue: String = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                
                //search category
                SearchCategoryView(categories: SampleData.searchCategories(), selectedCategory: SampleData.searchCategories()[0])
                
                VStack(spacing: 20) {
                    //search field
                    SearchFieldView(textValue: $searchValue)
                    
                    //commic
                    Commic3ColumnView(stories: SampleData.stories(), thumbnailHeight: 130, moreButton: false)
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
        }
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
        
        //Commic3ColumnView(stories: SampleData.stories(), thumbnailHeight: 130, moreButton: false)
    }
}

struct ViewMoreView_Previews: PreviewProvider {
    static var previews: some View {
        ViewMoreView()
    }
}
