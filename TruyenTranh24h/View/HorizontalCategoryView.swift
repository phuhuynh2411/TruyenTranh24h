//
//  HorizontalCategoryView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 03/06/2021.
//

import SwiftUI

struct HorizontalCategoryView: View {
    let rows: [GridItem] =
        Array(repeating: .init(.flexible()), count: 1)
    var categories: [Category]
    var showPlaceholder = false
    
    var placeholders: [Category] = {
        var categories: [Category] = []
        for i in -6...0 {
            categories.append(Category.placeholder(id: i))
        }
        return categories
    }()
    
    var body: some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(showPlaceholder ? placeholders : categories){ category in
                    CategoryItemView(category: category)
                }
                .redacted(reason: showPlaceholder ? .placeholder : [])
            }
            .frame(height: 90)
            .padding([.leading, .trailing], 16)
        }
    }
}

struct HorizontalCategoryView_Previews: PreviewProvider {
    @State static var categories = SampleData.categories()
    
    static var previews: some View {
        HorizontalCategoryView(categories: categories)
    }
}
