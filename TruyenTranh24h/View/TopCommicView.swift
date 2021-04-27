//
//  TopCommicView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 27/04/2021.
//

import SwiftUI

struct TopCommicView: View {
    var body: some View {
        NavigationView {
            CommicView(stories: SampleData.stories())
                .navigationTitle("Top Commic")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TopCommicView_Previews: PreviewProvider {
    static var previews: some View {
        TopCommicView()
    }
}
