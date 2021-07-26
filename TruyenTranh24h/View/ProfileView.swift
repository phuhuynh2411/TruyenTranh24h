//
//  ProfileView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 26/07/2021.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                TopView()
                    .frame(height: 50)
                
                NotLogginView()
            }
        }
    }
}

private struct NotLogginView: View {
    
    var body: some View {
        VStack(spacing: 30) {
            Image("avatar_placeholder")
            Text("press-here-to-login")
                .font(.system(size: 14, weight: .medium))
            
            Button(action: {}, label: {
                NavigationLink(destination: RegisterLoginView()) {
                    OrrangeButtonView(text: "register")
                }
            })
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
        }
    }
}

private struct TopView: View {
    
    var body: some View {
        HStack {
            Spacer()
            Text("profile")
                .font(.system(size: 14, weight: .bold))
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .navigationBarHidden(true)
    }
}
