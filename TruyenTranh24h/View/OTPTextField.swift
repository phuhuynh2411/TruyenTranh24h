//
//  OTPTextField.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI

struct OTPTextField: View {
    @Binding var textValue: String
    var numberOfDigits = 4
    
    var body: some View {
        ZStack {
            pinView
            backgroundTextField
        }
    }
    
    var pinView: some View {
        HStack {
            ForEach(0..<numberOfDigits, id: \.self) { index in
                viewForIndex(index)
            }
        }
    }
    
    private func viewForIndex(_ index: Int) -> some View {
        var value = ""
        if index < textValue.count {
            let i = textValue.index(textValue.startIndex, offsetBy: index)
            value = String(textValue[i...i])
        }
        return HStack {
            Spacer()
            Text(value)
                .font(.system(size: 16, weight: .bold))
            Spacer()
        }
        .padding(10)
        .background(Color("categoryTextFg"))
        .cornerRadius(8)
    }
    
    var backgroundTextField: some View {
        return TextField("", text: $textValue)
            .foregroundColor(.clear)
            .keyboardType(.numberPad)
            .accentColor(.clear)
            .onChange(of: textValue, perform: { value in
                if value.count > numberOfDigits {
                    textValue = String(value.prefix(numberOfDigits))
                }
            })
    }
}

struct OTPTextField_Previews: PreviewProvider {
    @State static var textValue: String = "1234"
    static var previews: some View {
        OTPTextField(textValue: $textValue)
    }
}
