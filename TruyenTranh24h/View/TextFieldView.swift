//
//  TextFieldView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI

struct TextFieldView: View {
    var textValue: Binding<String>
    var disable: Bool = false
    var placeholderText: String = "Enter value"
    var rightIcon: Image? =  Image(systemName: "magnifyingglass")
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            rightIcon?
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 10, height: 10)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                .foregroundColor(Color("iconGray"))
            
            TextField(LocalizedStringKey(placeholderText), text: textValue)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 32))
                .font(.system(size: 13, weight: .light))
                .disabled(disable)
            
        }
        .frame(height: 40)
        .background(Color("textFieldBg"))
        .cornerRadius(16.0)

    }
    
}

struct TextFieldView_Previews: PreviewProvider {
    @State static var textValue: String = ""
    static var previews: some View {
        TextFieldView(textValue: $textValue)
    }
}
