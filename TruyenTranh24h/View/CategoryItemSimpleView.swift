//
//  CategoryItemSimpleView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI

struct CategoryItemSimpleView: View {
    var category: Category
    var isSelected: Bool = false
    
    var body: some View {
        Text(category.name)
            .font(.system(size: isSelected ? 16 : 13, weight: isSelected ? .bold : .medium))
            .foregroundColor(isSelected ? .black : Color("categoryTextFg"))
    }
}

struct CategoryItemSimpleView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemSimpleView(category: SampleData.categories()[0])
        
        CategoryItemSimpleView(category: SampleData.categories()[1])

        CategoryItemSimpleView(category: SampleData.categories()[2])
    }
}
