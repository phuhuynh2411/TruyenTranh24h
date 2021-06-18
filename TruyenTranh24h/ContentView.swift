//
//  ContentView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("home")
                        .renderingMode(.template)
                    
                    Text("home")
                }
            
            SuggestedCommicView()
                .tabItem {
                    Image("category-1")
                        .renderingMode(.template)
                    Text("category")
                }
            
            Text("History")
                .tabItem {
                    Image("history")
                        .renderingMode(.template)
                    
                    Text("history")
                }
            
            Text("Follow")
                .tabItem {
                    Image("star-1")
                        .renderingMode(.template)
                    
                    Text("follow")
                }
            
            Text("Profile")
                .tabItem {
                    Image("me")
                        .renderingMode(.template)
                    
                    Text("me")
                }
        }
        .accentColor(Color("iconSelectedFg"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.locale, .init(identifier: "us"))
        
        ContentView()
            .environment(\.locale, .init(identifier: "vi"))
    }
}
