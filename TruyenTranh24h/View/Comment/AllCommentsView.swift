//
//  AllCommentsView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 19/06/2021.
//

import SwiftUI
import RemoteImageView

struct AllCommentsView: View {
    @State private var selectedFilter: CommentFilter = .oldest
    @State var inputText: String = ""
    @EnvironmentObject var allCommentModel: AllCommentModel
        
    private var leftImage: AnyView {
        let image = RemoteImageView(stringURL: "")
            .frame(width: 32, height: 32)
            .clipShape(Circle())
        return AnyView(image)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            TopView()
                .frame(height: 50)
            
            // Filter section
            HStack(spacing: 16) {
                Spacer()
                Button(action: {
                    allCommentModel.sortCommentNewest()
                    selectedFilter = .newest
                }, label: {
                    Text("newest")
                        .font(.system(size: 10, weight: .light))
                        .foregroundColor(selectedFilter == .newest ? Color("mainTitleText") : Color("dateChaperItemFg"))
                })
                
                Text("|")
                    .font(.system(size: 10, weight: .light))
                    .foregroundColor(Color("dateChaperItemFg"))
                
                Button(action: {
                    allCommentModel.sortCommentOldest()
                    selectedFilter = .oldest
                }, label: {
                    Text("oldest")
                        .font(.system(size: 10, weight: .light))
                        .foregroundColor(selectedFilter == .oldest ? Color("mainTitleText") : Color("dateChaperItemFg"))
                })
            }
            
            // Comments
            ScrollView(showsIndicators: false) {
                CommentView(comments: allCommentModel.comments ?? [])
            }
            .padding(.top, 16)
            
            // Comment input view
            CommentInputView(textValue: $inputText, leftImage: leftImage)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        // navigation setting
        .navigationBarHidden(true)

    }
    
    enum CommentFilter {
        case newest
        case oldest
    }
    
    private struct TopView: View {
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
        var body: some View {
            ZStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        BackButtonView()
                            .foregroundColor(.gray)
                    })
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("all-comments")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
            }
        }
    }
}

struct AllCommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AllCommentsView()
        }
    }
}
