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
    @Binding var categories: [Category]
    
    @State var placeholders: [Category] = {
        var categories: [Category] = []
        for i in -6...0 {
            categories.append(Category.placeholder(id: i))
        }
        return categories
    }()
    
    var body: some View {
        let count = categories.count > 0 ? categories.count : placeholders.count
        return ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(0..<count, id: \.self) { i in
                    CategoryItemView(category: categories.count > 0 ? $categories[i] : $placeholders[i])
                }
                .redacted(reason:  self.categories.count == 0 ? .placeholder : [])
            }
            .frame(height: 90)
            .padding([.leading, .trailing], 16)
        }
    }
}

struct HorizontalCategoryView_Previews: PreviewProvider {
    @State static var categories = SampleData.categories()
    
    static var previews: some View {
        HorizontalCategoryView(categories: $categories)
    }
}
