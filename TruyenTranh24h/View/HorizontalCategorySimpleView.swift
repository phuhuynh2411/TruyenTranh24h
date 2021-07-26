//
//  HorizontalCategorySimpleView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI

struct HorizontalCategorySimpleView: View {
    let rows: [GridItem] =
             Array(repeating: .init(.flexible()), count: 1)
    @State var categories: [Category]
    @State var selectedCategory: Category = SampleData.categories()[0]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 20) {
                ForEach(categories){ category in
                    CategoryItemSimpleView(category: category, isSelected: selectedCategory == category)
                }
            }
        }
    }
}

struct HorizontalCategorySimpleView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCategorySimpleView(categories: SampleData.categories())
    }
}
