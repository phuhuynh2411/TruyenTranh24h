//
//  SearchStoryView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 17/07/2021.
//

import SwiftUI

struct SearchStoryView: View {
    @State var searchText: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        BackButtonView()
                    })
                    SearchFieldView(textValue: $searchText)
                }
                .padding()
                
                // Found story
                FoundStoryView()
                    .padding()
                
                // Category view
                HorizontalCategoryView(categories: SampleData.categories())
                LineView()
                
                PopularSearchView()
                    .padding()
                
                LastSearchView()
                    .padding()
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

private struct PopularSearchView: View {
    
    var body: some View {
        let columns: [GridItem] = Array(repeating: GridItem(), count: 4)
        
        VStack {
            HStack {
                Text("popular-search")
                    .font(.system(size: 14, weight: .bold, design: .default))
                Spacer()
            }
           
            LazyVGrid(columns: columns, alignment: .leading){
                ForEach((0..<10), id: \.self)  { _ in
                    GrayButtonView()
                }
            }
            
        }
    }
}

private struct LastSearchView: View {
    
    var body: some View {
        
        VStack {
            HStack {
                Text("recent-search")
                    .font(.system(size: 14, weight: .bold, design: .default))
                Spacer()
                GrayButtonView(text: "Clear all")
            }
            ForEach((0..<50), id: \.self){ i in
                LazyVStack (alignment: .leading){
                    Button(action: {}, label: {
                        Text("Search \(i)")
                            .font(.system(size: 11, weight: .regular))
                            .frame(height: 30)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

private struct FoundStoryView: View {
    @State var stories = SampleData.stories()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("recent-search")
                    .font(.system(size: 14, weight: .bold, design: .default))
                Spacer()
            }
            
            VStack (alignment: .leading) {
                ForEach(stories) { story in
                    HStack (alignment: .top) {
                        ListStoryThumbnailView(story: story, thumbnailHeight: 60)
                            .frame(width: 60, height: 60)
                        
                        Text(story.title)
                            .font(.system(size: 13, weight: .regular))
                    }
                }
            }
        }
    }
}

struct SearchStoryView_Previews: PreviewProvider {
    static var previews: some View {
        SearchStoryView()
    }
}
