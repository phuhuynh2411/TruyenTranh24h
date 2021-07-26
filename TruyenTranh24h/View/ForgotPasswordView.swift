//
//  ForgotPasswordView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI

struct ForgotPasswordView: View {
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
                
                EntryView()
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

private struct EntryView: View {
    @State var email: String = ""
    
    var body: some View {
        VStack {
            VStack (spacing: 25){
                TextFieldView(textValue: $email
                              , placeholderText: "enter-email")
                
            }
            .padding()
            
            OrrangeButtonView(text: "send")
        }
    }
}

private struct TopView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                BackButtonView()
            })
            .buttonStyle(PlainButtonStyle())
            Spacer()
            
            Text("forgot-password")
                .font(.system(size: 14, weight: .bold))
            
            Spacer()
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

