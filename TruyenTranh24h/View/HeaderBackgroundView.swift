//
//  HeaderBackgroundView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 17/06/2021.
//

import SwiftUI
import URLImage

struct HeaderBackgroundView: View {
    @State var image: Image?
    @Binding var height: CGFloat
    @State var stringURL: String
    
    var body: some View {
        if let image = self.image {
            image
                .resizable()
                .renderingMode(.original)
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: height > 0 ? height: 0)
                .clipped()
                .overlay(Color.blue.opacity(0.3))
            
        } else {
            URLImage(URL(string: stringURL)!) { image in
                image
                    .resizable()
                    .renderingMode(.original)
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: height)
                    .clipped()
                    .onAppear {
                        self.image = image
                    }
                    .overlay(Color.blue.opacity(0.3))
            }
        }
        
    }
}

struct HeaderBackgroundView_Previews: PreviewProvider {
    @State static var height: CGFloat = 250
    
    static var previews: some View {
        HeaderBackgroundView(height: $height, stringURL: "https://github.com/phuhuynh2411/testImage/blob/main/quy-tu-dao_1528892875.jpg?raw=true")
    }
}
