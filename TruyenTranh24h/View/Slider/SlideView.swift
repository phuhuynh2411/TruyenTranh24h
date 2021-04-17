//
//  SlideView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 15/04/2021.
//

import SwiftUI
import OSLog

struct SlideView: View {
    @State var  stories: [Story]
    
    @State private var offset: CGPoint = .zero
    @State private var lastOffset: CGPoint = .zero
    @State private var index: Int = 0
    let hStackSpacing:CGFloat = 9.0
    
    var body: some View {
        ZStack (alignment: .bottom) {
            GeometryReader { geo in
                // HStack for the image
                
                HStack(spacing: hStackSpacing) {
                    ForEach(stories) { story in
                        SlideThumbnailView(story: story)
                            .frame(width: geo.size.width)
                    }
                }
                .onAppear {
                    // Add the last item before the last item
                    // Add the first item after last item
                    if let lastItem = stories.last, let firstItem = stories.first  {
                        self.stories.insert(lastItem, at: 0)
                        self.stories.append(firstItem)
                    }
                    // Move to the first item
                    self.offset = CGPoint(x: -(UIScreen.main.bounds.width + hStackSpacing), y: 0)
                    
                    // Move index to the first item
                    self.index = 1
                    
                    // Set the last offset to the offet
                    self.lastOffset = self.offset
                }
                .offset(x: offset.x, y: offset.y)
                
                // Add drag events to the scrollview
                .gesture(drag)
            }
            
            // Index View
            HStack {
                //Spacer()
                ForEach((0...stories.count - 3), id: \.self) { _ in
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 10, height: 10)
                        .padding(.bottom)
                }
            }
        }
        .frame(height: 180)
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                self.offset =  CGPoint(x: state.location.x  - state.startLocation.x + self.lastOffset.x , y: self.offset.y)
            }
            .onEnded { state in
                withAnimation{
                    self.offset = CGPoint(x: self.offset.x + state.predictedEndLocation.x, y: self.offset.y)
                    if self.offset.x > self.lastOffset.x {
                        index -= 1
                    } else {
                        index += 1
                    }
                    
                    self.offset = CGPoint(x: -CGFloat(index) * UIScreen.main.bounds.size.width - (hStackSpacing * CGFloat(index)), y: self.offset.y)
                    
                    // Save the last offset for the next times
                    self.lastOffset = self.offset
                }
                
                // Cycel the slider
                // if it's the last item, set the index to 1
                if index == stories.count - 1 {
                    index = 1
                    self.offset = CGPoint(x: -CGFloat(index) * UIScreen.main.bounds.size.width - (hStackSpacing * CGFloat(index)), y: self.offset.y)
                    lastOffset = offset
                }
                // if it's on the first item, set the index to the last item
                if index == 0 {
                    index = stories.count - 2
                    self.offset = CGPoint(x: -CGFloat(index) * UIScreen.main.bounds.size.width - (hStackSpacing * CGFloat(index)), y: self.offset.y)
                    lastOffset = offset
                }
            }
    }
    
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlideView(stories: SampleData.stories())
    }
}
