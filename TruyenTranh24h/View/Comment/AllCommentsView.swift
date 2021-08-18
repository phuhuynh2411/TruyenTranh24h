//
//  AllCommentsView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 19/06/2021.
//

import SwiftUI
import RemoteImageView

struct AllCommentsView: View {
    @State private var selectedFilter: CommentFilter = .newest
    var comments: [Comment]?
    @State var inputText: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private var leftImage: AnyView {
        let image = RemoteImageView(stringURL: "")
            .frame(width: 32, height: 32)
            .clipShape(Circle())
        return AnyView(image)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Filter section
            HStack(spacing: 16) {
                Spacer()
                Button(action: {}, label: {
                    Text("newest")
                        .font(.system(size: 10, weight: .light))
                        .foregroundColor(selectedFilter == .newest ? Color("mainTitleText") : Color("dateChaperItemFg"))
                })
                
                Text("|")
                    .font(.system(size: 10, weight: .light))
                    .foregroundColor(Color("dateChaperItemFg"))
                
                Button(action: {}, label: {
                    Text("oldest")
                        .font(.system(size: 10, weight: .light))
                        .foregroundColor(selectedFilter == .oldest ? Color("mainTitleText") : Color("dateChaperItemFg"))
                })
            }
            
            // Comments
            ScrollView(showsIndicators: false) {
                CommentView(comments: comments ?? [])
            }
            .padding(.top, 16)
            
            // Comment input view
            CommentInputView(textValue: $inputText, leftImage: leftImage)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        // navigation setting
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarTitle("all-comments")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: navItemsView)

    }
    
    enum CommentFilter {
        case newest
        case oldest
    }
    
    var navItemsView: some View {
        HStack {
            BackButtonView()
                .foregroundColor(.gray)
            
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            .padding(.leading, 16)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(
            HStack {
                Text("all-comments")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.black)
            }
        )
        //.background(Color.red)
    }
}

struct AllCommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AllCommentsView(comments:  SampleData.comments())
        }
    }
}
