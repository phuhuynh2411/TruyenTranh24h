//
//  TopCommicView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 27/04/2021.
//

import SwiftUI
import RefreshableScrollView

struct SuggestedCommicView: View {
    @State var refresh: Bool = false
    
    var refreshAction:  Void {
        // add your code here
        // remmber to set the refresh to false
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.refresh = false
        }
    }
    
    var body: some View {
        NavigationView {
            RefreshableScrollView(refreshing: $refresh, action: { refreshAction }) {
                //Commic2ColumnView(stories: SampleData.stories())
            }
            .navigationTitle("Top Commic")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TopCommicView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedCommicView()
    }
}
