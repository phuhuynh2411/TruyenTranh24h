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
    var isAutoChangeSlide: Bool = true
    var second: Int = 3
    
    @State private var offset: CGPoint = .zero
    @State private var lastOffset: CGPoint = .zero
    @State private var index: Int = 0
    let hStackSpacing:CGFloat = 9.0
    @State private var draggingTime = Date()
    
    var body: some View {
        VStack { // Use this view to move the slider to top
            
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
                        changeSide(newIndex: 1, withAni: false)
                        
                        // enable auto change slide
                        guard isAutoChangeSlide else {
                            return
                        }
                        // Auto go to next slide in three seconds
                        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                            let delta = Date().timeIntervalSince(self.draggingTime)
                            if Int(delta) > self.second - 1 { // 3 seconds
                                changeSide(newIndex: self.index + 1)
                                self.draggingTime = Date()
                            }
                        }
                    }
                    .offset(x: offset.x, y: offset.y)
                    
                    // Add drag events to the scrollview
                    .gesture(drag)
                }
                
                // Index View
                HStack {
                    //Spacer()
                    ForEach((1...stories.count - 2), id: \.self) { i in
                        Circle()
                            .foregroundColor(i == self.index ? .blue : .white )
                            .frame(width: 7, height: 7)
                            .padding(.bottom)
                    }
                }
            }
            .frame(height: 190)
            
            // Move the things above to top
            Spacer()
        }
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { state in
                self.offset =  CGPoint(x: state.location.x  - state.startLocation.x + self.lastOffset.x , y: self.offset.y)
                
                // Update the dragging time
                self.draggingTime = Date()
            }
            .onEnded { state in
                withAnimation {
                    self.offset = CGPoint(x: self.offset.x + state.predictedEndLocation.x, y: self.offset.y)
                    if self.offset.x > self.lastOffset.x {
                        index -= 1
                    } else {
                        index += 1
                    }
                }
                changeSide(newIndex: index)
            }
    }
    
    private func changeSide(newIndex: Int, withAni: Bool = true) {
        if withAni {
            withAnimation {
                setIndex(newIndex)
            }
        } else {
            setIndex(newIndex)
        }
        
        // Cycel the slider
        // if it's the last item, set the index to 1
        if newIndex == stories.count - 1 {
            self.index = 1
            self.offset = CGPoint(x: -CGFloat(self.index) * UIScreen.main.bounds.size.width - (hStackSpacing * CGFloat(self.index)), y: self.offset.y)
        } else if newIndex == 0 {
            self.index = stories.count - 2
            self.offset = CGPoint(x: -CGFloat(self.index) * UIScreen.main.bounds.size.width - (hStackSpacing * CGFloat(self.index)), y: self.offset.y)
        }
        
        // Save the last offset for the next times
        self.lastOffset = self.offset
    }
    
    private func setIndex(_ newIndex: Int) {
        self.index = newIndex
        self.offset = CGPoint(x: -CGFloat(newIndex) * UIScreen.main.bounds.size.width - (hStackSpacing * CGFloat(newIndex)), y: self.offset.y)
    }
    
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlideView(stories: SampleData.localStories())
    }
}
