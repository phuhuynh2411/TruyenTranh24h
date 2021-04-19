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
                        changeSide(index: 1)
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
        
        //TODO: Auto change slide in 2 seconds
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
                    changeSide(index: index)
                }
                
                // Cycel the slider
                // if it's the last item, set the index to 1
                if index == stories.count - 1 {
                    index = 1
                }
                // if it's on the first item, set the index to the last item
                if index == 0 {
                    index = stories.count - 2
                }
                changeSide(index: index)
            }
    }
    
    private func changeSide(index: Int) {
        self.index = index
        self.offset = CGPoint(x: -CGFloat(index) * UIScreen.main.bounds.size.width - (hStackSpacing * CGFloat(index)), y: self.offset.y)
        
        // Save the last offset for the next times
        self.lastOffset = self.offset
    }
    
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlideView(stories: SampleData.localStories())
    }
}
