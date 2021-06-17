//
//  CacheImageView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 17/06/2021.
//

import SwiftUI
import URLImage

struct CacheImageView: View {
    @State private var image: Image?
    @State var stringURL: String
    
    var body: some View {
        if let image = self.image {
            image
        } else {
            URLImage(URL(string: stringURL)!) { image in
                image
            }
        }
    }
}

struct CacheImageView_Previews: PreviewProvider {
    static var previews: some View {
        CacheImageView(stringURL: "https://github.com/phuhuynh2411/testImage/blob/main/quy-tu-dao_1528892875.jpg?raw=true")
    }
}
