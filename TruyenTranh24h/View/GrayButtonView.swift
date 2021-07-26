//
//  GrayButtonView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 17/07/2021.
//

import SwiftUI

struct GrayButtonView: View {
        
    @State var text: String = "Button"
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 10, weight: .light))
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
        }
        .background(Color("seeMoreButtonBg"))
        .foregroundColor(Color("seeMoreButtonFg"))
        .cornerRadius(13.0)
    }
}

struct GrayButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GrayButtonView()
    }
}
