//
//  CategoryItemView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 03/06/2021.
//

import SwiftUI
import Kingfisher

struct CategoryItemView: View {
    @Binding var category: Category
    @State private var isLoaded = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ZStack {
                KFImage(URL(string: category.imageURLString), isLoaded: $isLoaded)
                    .frame(width: 46, height: 46)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .allowsHitTesting(false)
                
                if !isLoaded {
                    Image("image_placeholder")
                        .frame(width: 46, height: 46 )
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                    
                }
            }
            
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
