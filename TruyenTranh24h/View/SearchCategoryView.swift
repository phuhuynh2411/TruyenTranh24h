//
//  SearchCategoryView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 11/06/2021.
//

import SwiftUI

struct SearchCategoryView: View {
    @State var categories: [SearchCategory]
    @State var selectedCategory: SearchCategory?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack (spacing: 25){
                ForEach(categories) { category in
                    SearchCategoryItemView(searchCategory: category, isSelected: isSelected(category))
                }
            }
        }
    }
    
    private func isSelected(_ category: SearchCategory) -> Bool {
        var isSelected = false
        if let selectedCategory = self.selectedCategory, selectedCategory == category {
            isSelected = true
        }
        return isSelected
    }
}

struct SearchCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategoryView(categories: SampleData.searchCategories(), selectedCategory: SampleData.searchCategories()[0])
    }
}
