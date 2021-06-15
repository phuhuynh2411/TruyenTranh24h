//
//  StoryView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 27/04/2021.
//

import SwiftUI
import RemoteImageView

struct StoryView: View {
    @State var story: Story
    @State private var offset = CGFloat.zero
    @State private var showBackButton = false
    @State private var selectedTab: StoryTab = .content
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(showsIndicators: false) {
                VStack {
                    // Title
                    StoryHeaderView(story: story, height: 300)
                        .offset(y: -64 )
                        .frame(height: 175)
                    
                    // Tab view
                    TabView(selectedTab: $selectedTab)
                    if selectedTab == .content {
                        StoryContentView()
                    } else {
                        StoryChapterView()
                    }
                    
                }
                .background(GeometryReader {
                    Color.clear.preference(key: ViewOffsetKey.self,
                                           value: -$0.frame(in: .named("scroll")).origin.y)
                })
                .onPreferenceChange(ViewOffsetKey.self) { self.updateOffset($0) }
            }
            .coordinateSpace(name: "scroll")
            .navigationBarColor(backgroundColor: showBackButton ? .white : .none , titleColor: .blue)
            // adjust back button
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: self.backButtonView())
        }
    }
    
    private func updateOffset(_ offset: CGFloat) {
        print("offset >> \(self.offset)")
        self.offset = offset
        withAnimation {
            showBackButton = offset > 0 ? true : false
        }
    }
    
    private func backButtonView() -> some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .frame(width: 10, height: 19)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .frame(width: 70, height: 30)
        })
    }
    
    enum StoryTab {
        case content
        case chapter
    }
    
    struct TabView: View {
        @Binding var selectedTab: StoryTab
        
        var body: some View {
            HStack(alignment: .center) {
                // content
                Button(action: {
                    withAnimation {
                        selectedTab = .content
                    }
                }, label: {
                    VStack {
                        Spacer()
                        Text("Content")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(Color("mainTitleText"))
                        Spacer()
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(selectedTab == .content ? Color("borderFg") : .white)
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
                        Text("Chapter")
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(Color("mainTitleText"))
                        
                        Spacer()
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(selectedTab == .chapter ? Color("borderFg") : .white)
                    }
                })
                
            }
            .frame(height: 40)
        }
    }
    
    struct StoryContentView: View {
        var body: some View {
            // Comments
            CommentView(comments: SampleData.comments())
        }
    }
    
    struct StoryChapterView: View {
        var body: some View {
            Text("Chapter view")
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(story: SampleData.stories()[1])
    }
}
