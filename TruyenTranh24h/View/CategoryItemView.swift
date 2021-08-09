//
//  CategoryItemView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 03/06/2021.
//

import SwiftUI
import Kingfisher

struct CategoryItemView: View {
    var category: Category
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            KFImage(URL(string: category.imageURLString))
                .placeholder({
                    Image("image_placeholder")
                        .frame(width: 46, height: 46 )
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                })
                .frame(width: 46, height: 46)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
            
            Text(category.name)
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
                .frame(height: 30, alignment: .top)
            
        }
        .allowsHitTesting(false)
        .frame(width: 70, height: 90)
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    @State static var category = SampleData.categories()[0]
    static var previews: some View {
        HStack {
            CategoryItemView(category: category)
            
            CategoryItemView(category: category)
            
            CategoryItemView(category: category)
        }
    }
}
