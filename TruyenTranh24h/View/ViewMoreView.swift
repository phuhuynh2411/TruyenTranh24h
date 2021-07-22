//
//  ViewMoreView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 11/06/2021.
//

import SwiftUI

struct ViewMoreView: View {
    @State var searchValue: String = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            TopView()
                .padding()
            
            VStack(alignment: .leading) {
                VStack(spacing: 20) {
                    //search field
                    SearchFieldView(textValue: $searchValue)
                    
                    //commic
                    Commic3ColumnView(stories: SampleData.stories(), thumbnailHeight: 130, moreButton: false)
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
            }
        }
        // navigation settings
        .navigationBarHidden(true)
    
    }
}

private struct TopView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            BackButtonView()
                .foregroundColor(Color("backButtonFg"))
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            SearchCategoryView(categories: SampleData.searchCategories(), selectedCategory: SampleData.searchCategories()[0])
        }
    }
}

struct ViewMoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ViewMoreView()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
