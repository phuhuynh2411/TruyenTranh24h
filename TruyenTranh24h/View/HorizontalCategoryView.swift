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
    @State var categories: [Category]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(categories){ category in
                    CategoryItemView(category: category)
                }
            }
            .frame(height: 90)
        }
    }
}

struct HorizontalCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalCategoryView(categories: SampleData.categories())
    }
}
