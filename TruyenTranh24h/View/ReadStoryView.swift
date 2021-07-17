//
//  ReadStoryView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 10/07/2021.
//

import SwiftUI
import RemoteImageView

struct ReadStoryView: View {
    @State var stories: [Story]
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showComment = false
    
    var body: some View {
        ZStack {
            EquatableView(content: ListImageView(stories: $stories))
            
            // Comment input view
            if showComment {
                CommentView()
            }
        }
        .navigationBarHidden(true)
        .onTapGesture {
            withAnimation {
                showComment.toggle()
            }
        }
    }
    
    var navBarItems: some View {
        HStack {
            BackButtonView()
                .foregroundColor(.white)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding(.leading, 16)
            
            Spacer()
        }
        .background(
            Color.black
                .opacity(0.7)
                .brightness(-39)
        )
        .frame(width: UIScreen.main.bounds.width)
    }
    
    struct ListImageView: View, Equatable {
        
        static func == (lhs: ReadStoryView.ListImageView, rhs: ReadStoryView.ListImageView) -> Bool {
            lhs.stories == rhs.stories
        }
        
        @Binding var stories: [Story]
        
        var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(stories){ story in
                        RemoteImageView(stringURL: story.featureImage)
                    }
                }
            }
        }
    }
    
    struct CommentView: View {
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        @State var inputText: String = ""

        var body: some View {
            // Comment input view
            VStack {
                HStack {
                    HStack {
                        BackButtonView()
                            .foregroundColor(.white)
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                            .padding(.leading, 16)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image("3dot")
                                .padding(.trailing, 16)
                        })
                    }
                    .background(
                        Color.black
                            .frame(height: 180)
                            .opacity(0.5)
                            .offset(y: -70)
                    )
                }
            
                Spacer()
                VStack {
                    CommentInputView(textValue: $inputText, badgeText: "", leftImage: self.commentIcon)
                        .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 16))
                    HStack {
                        Button(action: {}, label: {
                            Image("back")
                        })
                        
                        Spacer()
                        Button(action: {}, label: {
                            Image("list")
                        })
                        
                        Spacer()
                        Button(action: {}, label: {
                            Image("next")
                        })
                    }
                    .padding(16)
                }
                .background(
                    Color.black
                    .frame(height: 200)
                    .opacity(0.5)
                    .offset(y: 50)
                )
               
            }
        }
        
        private var commentIcon: AnyView {
            let image = Image("comment")
            return AnyView(image)
        }
    }
    
}

struct ReadStoryView_Previews: PreviewProvider {
    static var previews: some View {
        ReadStoryView(stories: SampleData.stories())
    }
}
