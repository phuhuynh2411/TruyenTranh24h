//
//  TruyenTranh24hApp.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI

@main
struct TruyenTranh24hApp: App {
    @State var textValue = "1234"
    var body: some Scene {
        WindowGroup {
            //ContentView()
            //CategoryItemView(category: SampleData.categories()[0])
            //CommicView(stories: SampleData.stories(), title: "Top commic")
            OTPTextField(textValue: $textValue)
        }
    }
}
