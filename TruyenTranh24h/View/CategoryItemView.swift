//
//  CategoryItemView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 03/06/2021.
//

import SwiftUI
import RemoteImageView

struct CategoryItemView: View {
    @Binding var category: Category
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            RemoteImageView(stringURL: category.imageURLString)
                .frame(width: 46, height: 46)
                .background(Color.secondary)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            
            Text(category.name)
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
                .frame(height: 30, alignment: .top)
            
        }
        .frame(width: 70, height: 90)
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    @State static var category = SampleData.categories()[0]
    static var previews: some View {
        HStack {
            CategoryItemView(category: $category)
            
            CategoryItemView(category: $category)

            CategoryItemView(category: $category)
        }
    }
}
