//
//  ReadStoryView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 10/07/2021.
//

import SwiftUI
import Kingfisher

struct ReadStoryView: View {
    @EnvironmentObject var readStoryModel: ReadStoryModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var showComment = false
    
    var body: some View {
        ZStack {
            EquatableView(content: ListImageView(images: readStoryModel.chapter.images ?? []))
            
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
            lhs.images == rhs.images
        }
        
        var images: [String]
        
        var body: some View {
            ScrollView {
                LazyVStack {
                    ForEach(0..<images.count, id: \.self){ index in
                        KFImage(URL(string: images[index]))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }
        }
    }
    
    struct CommentView: View {
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        @State var inputText: String = ""
        @EnvironmentObject var readStoryModel: ReadStoryModel
        
        var body: some View {
            // Comment input view
            VStack {
                ZStack {
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
                    
                    HStack {
                        Spacer()
                        Text(readStoryModel.chapter.title)
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular, design: .default))
                        Spacer()
                    }
                }
            
                Spacer()
                VStack {
                    CommentInputView(textValue: $inputText, badgeText: "", leftImage: self.commentIcon)
                        .padding(EdgeInsets(top: 10, leading: 16, bottom: 0, trailing: 16))
                    HStack {
                        Button(action: {
                            self.readStoryModel.preChapter()
                        }, label: {
                            Image("back")
                        })
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            NavigationLink(
                                destination: ChapterListMainView()
                                    .environmentObject(ListChapterViewModel.sortChaptersNewest(story: readStoryModel.story)),
                                label: {
                                    Image("list")
                                })
                        })
                        
                        Spacer()
                        Button(action: {
                            self.readStoryModel.nextChapter()
                        }, label: {
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
        ReadStoryView()
    }
}
