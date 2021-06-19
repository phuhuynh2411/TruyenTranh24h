//
//  ViewMoreView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 11/06/2021.
//

import SwiftUI

struct ViewMoreView: View {
    @State var searchValue: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView(showsIndicators: false) {
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
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
        
        // navigation settings
        .navigationBarItems(leading: navItemsView)
        .navigationBarBackButtonHidden(true)
        
        //Commic3ColumnView(stories: SampleData.stories(), thumbnailHeight: 130, moreButton: false)
    }
    
    var navItemsView: some View {
        HStack {
            BackButtonView()
                .foregroundColor(Color("backButtonFg"))
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            //search category
            
            SearchCategoryView(categories: SampleData.searchCategories(), selectedCategory: SampleData.searchCategories()[0])
        }
        .frame(width: UIScreen.main.bounds.width)
        //.background(Color.blue)
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
