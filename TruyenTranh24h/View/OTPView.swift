//
//  OTPView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI

struct OTPView: View {
    var body: some View {
        ScrollView {
            VStack {
                TopView()
                    .frame(height: 50)
                    .padding()
                
                Image("logo")
                    .frame(width: 80, height: 80)
                    .padding(.bottom, 30)
                    .padding(.top, 30)
                
                EntryView()
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

private struct EntryView: View {
    @State var textValue: String = ""
    
    var body: some View {
        VStack {
            Text("otp-email-text")
                .font(.system(size: 13, weight: .regular))
            
            HStack (spacing: 25) {
                OTPTextField(textValue: $textValue)
            }
            .padding()
            
            OrrangeButtonView(text: "send")
            
            HStack {
                Text("you-dont-have-a-account")
                    .foregroundColor(Color("categoryTextFg"))
                    .font(.system(size: 13, weight: .regular))
                
                Button(action: {}, label: {
                    Text("sign-up")
                        .font(.system(size: 13, weight: .bold))
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.top, 80)
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
            
            Text("confirm-otp")
                .font(.system(size: 14, weight: .bold))
            
        }
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView()
    }
}
