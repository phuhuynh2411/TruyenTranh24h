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
    @State private var selectedTab: Tab = .signIn
 
    var body: some View {
        ScrollView {
            VStack {
                TopView(selectedTab: $selectedTab)
                    .frame(height: 50)
                    .padding()
                
                Image("logo")
                    .frame(width: 80, height: 80)
                    .padding(.bottom, 25)
                    .padding(.top, 25)
                
                if selectedTab == .signIn {
                    SignInView()
                } else {
                    SignUpView()
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

private struct SignInView: View {
    @State var accountText: String = ""
    @State var passwordText: String = ""
    
    var body: some View {
        VStack {
            VStack (spacing: 25){
                TextFieldView(textValue: $accountText, placeholderText: "username", rightIcon: Image("me"))
                
                TextFieldView(textValue: $passwordText, placeholderText: "password", rightIcon: Image("view"))
                
                HStack {
                    Spacer()
                    Button(action: {}) {
                        NavigationLink(
                            destination: ForgotPasswordView() ){
                            Group { Text("forgot-password") + Text(" ?") }
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(Color("categoryTextFg"))
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
            
            OrrangeButtonView(text: "sign-in")
            
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

private struct SignUpView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var password: String = ""
    @State var confirmpPassword: String = ""
    
    var body: some View {
        VStack {
            VStack (spacing: 25){
                TextFieldView(textValue: $firstName, placeholderText: "first-name", rightIcon: Image("me"))
                
                TextFieldView(textValue: $lastName, placeholderText: "last-name", rightIcon: Image("me"))
                
                TextFieldView(textValue: $password, placeholderText: "password", rightIcon: Image("view"))
                
                TextFieldView(textValue: $confirmpPassword, placeholderText: "confirm-password", rightIcon: Image("view"))
                
            }
            .padding()
            
            OrrangeButtonView(text: "sign-up")
        }
    }
}


private struct TopView: View {
    @Binding var selectedTab: Tab
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
            
            HStack(spacing: 70) {
                Button(action: {
                    selectedTab = .signIn
                }, label: {
                    Text("sign-in")
                        .font(.system(size: 14, weight: selectedTab == .signIn ? .bold : .regular))
                        .foregroundColor(selectedTab == .signIn ? .black : Color("categoryTextFg"))
                })
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {
                    selectedTab = .signUp
                }, label: {
                    Text("sign-up")
                        .font(.system(size: 14, weight: selectedTab == .signUp ? .bold : .regular))
                        .foregroundColor(selectedTab == .signUp ? .black : Color("categoryTextFg"))
                })
                .buttonStyle(PlainButtonStyle())
            }
            Spacer()
        }
    }
}

private enum Tab {
    case signIn
    case signUp
}

struct RegisterLoginView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterLoginView()
    }
}
