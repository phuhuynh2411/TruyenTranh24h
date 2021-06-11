//
//  SearchCategoryItemView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 11/06/2021.
//

import SwiftUI

struct SearchCategoryItemView: View {
    @State var searchCategory: SearchCategory
    @State var isSelected: Bool = false
    
    var body: some View {
        Text(searchCategory.title)
            .font(customFont())
            .foregroundColor(customColor())
    }
    
    private func customFont() -> Font {
        isSelected ? Font.system(size: 16, weight: .bold) : Font.system(size: 13, weight: .medium)
    }
    
    private func customColor() -> Color {
        isSelected ? Color.black : Color("categoryTextFg")
    }
}

struct SearchCategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        // normal
        SearchCategoryItemView(searchCategory: SampleData.searchCategories()[0])
        // selected stage
        SearchCategoryItemView(searchCategory: SampleData.searchCategories()[0], isSelected: true)
    }
}
