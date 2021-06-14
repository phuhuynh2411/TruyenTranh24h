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
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack(alignment: .top) {
            
            ScrollView {
                VStack {
                    // Title
                    StoryHeaderView(story: story)
                        .frame(height: 230)
                    //.offset(y: -60 )
                    
                    // Description
                    //Text(story.description)
                    
                    // Comments
                    CommentView(comments: SampleData.comments())
                }
                .background(GeometryReader {
                    Color.clear.preference(key: ViewOffsetKey.self,
                                           value: -$0.frame(in: .named("scroll")).origin.y)
                })
                .onPreferenceChange(ViewOffsetKey.self) { self.updateOffset($0) }
            }
            .coordinateSpace(name: "scroll")
            
            //.navigationBarHidden(true)
            .navigationBarColor(backgroundColor: showBackButton ? .white : .none , titleColor: .blue)
        }
    }
    
    private func updateOffset(_ offset: CGFloat) {
        print("offset >> \(self.offset)")
        self.offset = offset
        withAnimation {
            showBackButton = offset > 0 ? true : false
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
