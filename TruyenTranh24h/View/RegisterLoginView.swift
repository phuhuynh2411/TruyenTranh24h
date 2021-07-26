//
//  RegisterLoginView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI

struct RegisterLoginView: View {
    @State var accountText: String = ""
    @State var passwordText: String = ""
    
    var body: some View {
        VStack (spacing: 20){
            TextFieldView(textValue: $accountText, placeholderText: "username", rightIcon: Image("me"))
            
            TextFieldView(textValue: $passwordText, placeholderText: "password", rightIcon: Image("view"))
            
            HStack {
                Spacer()
                Button(action: {}, label: {
                    Group { Text("forgot-password") + Text(" ?") }
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(Color("categoryTextFg"))
                    
                })
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding()
    }
}

struct RegisterLoginView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLoginView()
    }
}
