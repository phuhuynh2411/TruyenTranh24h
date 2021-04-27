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
                    Image(systemName: "1.square.fill")
                    Text("Home")
                }
            
            TopCommicView(stories: SampleData.stories())
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Top Commics")
                }
            
            Text("History")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("History")
                }
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Profile")
                }
        }
        //.font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
