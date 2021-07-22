//
//  SearchFieldView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 04/06/2021.
//

import SwiftUI

struct SearchFieldView: View {
    var textValue: Binding<String>
    var disable: Bool = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 15, height: 15)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
            
            TextField("search-box-placeholder", text: textValue)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 32))
                .font(.system(size: 10, weight: .light))
                .disabled(disable)
            
        }
        .frame(height: 30)
        .background(Color("textFieldBg"))
        .cornerRadius(16.0)
    }
}

struct SearchFieldView_Previews: PreviewProvider {
    @State static var  textValue: String = ""
    
    static var previews: some View {
        SearchFieldView(textValue: $textValue)
    }
}
