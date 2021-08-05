//
//  NewPasswordView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 05/08/2021.
//

import SwiftUI

struct NewPasswordView: View {
 
    var body: some View {
        ScrollView {
            VStack {
                TopView()
                    .frame(height: 50)
                    .padding()
                
                Image("logo")
                    .frame(width: 80, height: 80)
                    .padding(.bottom, 25)
                    .padding(.top, 25)
                
                MainView()
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

private struct MainView: View {
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        VStack {
            VStack (spacing: 25){
                TextFieldView(textValue: $password, placeholderText: "password", rightIcon: Image("view"))
                
                TextFieldView(textValue: $confirmPassword, placeholderText: "confirm-password", rightIcon: Image("view"))
            }
            .padding()
            
            OrrangeButtonView(text: "confirm")
        }
    }
}

private struct TopView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    BackButtonView()
                })
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
            
            Text("new-password")
                .font(.system(size: 14, weight: .bold))
            
        }
    }
}

struct NewPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NewPasswordView()
    }
}
