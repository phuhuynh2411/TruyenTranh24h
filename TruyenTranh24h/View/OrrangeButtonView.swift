//
//  OrrangeButtonView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI

struct OrrangeButtonView: View {
    @State var text: String = "Button"
    @State var font: Font = Font.system(size: 14, weight: .regular)
    
    var body: some View {
        HStack(alignment: .center) {
            Text(LocalizedStringKey(text))
                .padding(EdgeInsets(top: 12, leading: 50, bottom: 12, trailing: 50))
                .foregroundColor(.white)
                .font(font)
        }
        .background(Color("chapterButtonBg"))
        .cornerRadius(26)
    }
}

struct OrrangeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        OrrangeButtonView()
    }
}
