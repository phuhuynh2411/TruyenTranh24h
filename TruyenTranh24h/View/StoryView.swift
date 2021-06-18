//
//  StoryView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 27/04/2021.
//

import SwiftUI
import URLImage
import RemoteImageView
import Combine

struct StoryView: View {
    @State var story: Story
    @State private var offset = CGFloat.zero {
        didSet {
            print("did set \(offset)")
        }
    }
    @State private var showBackButton = false
    @State private var selectedTab: StoryTab = .content
    @State private var imageBackgroundHeight: CGFloat = 250
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var image: Image?
    
    var body: some View {
        ZStack(alignment: .top) {
            // Color.blue.frame(height: 200)
            VStack(spacing: 0) {
                ScrollView(showsIndicators: false) {
                    VStack {
                        // Title
                        StoryHeaderView(story: story)
                            .frame(height: 160)
                        
                        // Tab view
                        TabView(selectedTab: $selectedTab)
                        if selectedTab == .content {
                            StoryContentView(story: $story)
                        } else {
                            StoryChapterView()
                        }
                        
                        
                    }
                    .scrollOffSet(offset: $offset.onChange { changeScrollOffset($0) })
                }
                .coordinateSpace(name: "scroll")
                
                // toolbar
                LineView()
                StoryToolbarView()
                    .frame(height: 34)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            }
            
        }.background(headerBackgroundView)
        
        // Navigation settings
        .navigationBarColor(backgroundColor: showBackButton ? .white : .none , titleColor: .blue)
        // adjust back button
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: navBarItems)
    }
    
    var headerBackgroundView: some View {
        VStack {
            HeaderBackgroundView(height: $imageBackgroundHeight, stringURL: story.featureImage)
                .offset(y: -100 )
            Spacer()
        }
    }
    
    var navBarItems: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 10, height: 19)
                        .foregroundColor(offset > 1 ? .gray : .white)
                    
                    Spacer()
                }
                .frame(width: 40, height: 30)
            })
            .padding(.leading, 16)
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(
            HStack {
                CacheImageView(stringURL: story.featureImage)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text(story.title)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.black)
            }
            .opacity(offset > 0 ? 1 : 0)
        )
    }
    
    private func changeScrollOffset(_ offset: CGFloat) {
        withAnimation {
            showBackButton = offset > 0 ? true : false
        }
        imageBackgroundHeight = 260 - offset
    }

    
    enum StoryTab {
        case content
        case chapter
    }
    
    struct TabView: View {
        @Binding var selectedTab: StoryTab
        
        var body: some View {
            HStack(alignment: .center, spacing: 0) {
                // content
                Button(action: {
                    withAnimation {
                        selectedTab = .content
                    }
                }, label: {
                    VStack {
                        Spacer()
                        Text("content")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(Color("mainTitleText"))
                        Spacer()
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(selectedTab == .content ? Color("borderFg") : Color("lineFg"))
                    }
                })
                
                
                // chapter
                Button(action: {
                    withAnimation {
                        selectedTab = .chapter
                    }
                }, label: {
                    VStack {
                        Spacer()
                        Text("chapter")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(Color("mainTitleText"))
                        
                        Spacer()
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(selectedTab == .chapter ? Color("borderFg") : Color("lineFg"))
                    }
                })
                
            }
            .frame(height: 40)
        }
    }
    
    struct StoryContentView: View {
        @Binding var story: Story
        @State var comments = SampleData.comments().prefix(5)
        
        var body: some View {
            VStack (spacing: 20){
                // Story summary
                StorySummary(story: $story)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
                LineView()
                // Comments
                CommentView(comments: Array(comments))
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                
                // All comments section
                Button(action: {}, label: {
                    Text("all-comments (\(comments.count.description))")
                        .font(.system(size: 12, weight: .light))
                        .foregroundColor(Color("mainTitleText"))
                })
                
                LineView()
                VStack (alignment: .leading){
                    Text("related-stories")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.black)
                    
                    Commic3ColumnView(stories: SampleData.stories()
                                      , thumbnailHeight: 130
                                      , moreButton: false)
                }
            }
            
        }
    }
    
    struct StoryChapterView: View {
        var body: some View {
            Text("Chapter view")
        }
    }
    
    struct StorySummary: View {
        @Binding var story: Story
        @State var readMore = false
        
        private let numberOfWords = 50
        
        var body: some View {
            VStack(alignment: .leading, spacing: 26) {
                // Update on text
                Text("Maecenas sed diam eget risus varius blandit sit amet non magna.")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color("mainTitleText"))
                
                // Author
                HStack {
                    Text("author")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(Color("summaryTextFg"))
                    
                    Text(story.title)
                        .font(.system(size: 12, weight: .light))
                        .italic()
                        .foregroundColor(Color("summaryTextFg"))
                }
                
                // Category
                HStack {
                    Text("category")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(Color("summaryTextFg"))
                    
                    Text(story.title)
                        .font(.system(size: 12, weight: .light))
                        .italic()
                        .foregroundColor(Color("summaryTextFg"))
                }
                
                VStack(alignment: .leading, spacing: 18) {
                    Text("short-summary")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.black)
                    
                    // Description
                    VStack (alignment: .leading, spacing: 10) {
                        Text(readMore == true ? story.description : story.description.words(numberOfWords) + "...")
                            .foregroundColor(Color("descriptionFg"))
                            .font(.system(size: 12, weight: .light))
                            .lineSpacing(8)
                            .multilineTextAlignment(.leading)
                            //.frame(height: (readMore == true ? 200 : 100))
                            
                        // Show read more button only if the number of words is more than 50
                        if story.description.wordCounts > numberOfWords {
                            Button(action: {
                                readMore.toggle()
                            }, label: {
                                Text( readMore ? "less" : "read-more")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(Color("mainTitleText"))
                            })
                        }
                    }
                }
               
            }
        }
    }
}



struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            StoryView(story: SampleData.stories()[1])
        }
//
//        NavigationView {
//            StoryView(story: SampleData.stories()[1])
//                .environment(\.locale, .init(identifier: "vi"))
//        }
    }
}
