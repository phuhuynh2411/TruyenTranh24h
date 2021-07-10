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
    @State var inputText: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(stories){ story in
                        RemoteImageView(stringURL: story.featureImage)
                    }
                }
            }
            
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
                            .opacity(0.7)
                            .brightness(-39)
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
                    .opacity(0.7)
                    .brightness(-39)
                    .offset(y: 50)
                )
               
            }
            
        }
        .navigationBarHidden(true)
    }
    
    private var commentIcon: AnyView {
        let image = Image("comment")
        return AnyView(image)
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
    
}

struct ReadStoryView_Previews: PreviewProvider {
    static var previews: some View {
        ReadStoryView(stories: SampleData.stories())
    }
}
