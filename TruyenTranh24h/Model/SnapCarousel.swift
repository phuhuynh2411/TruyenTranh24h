//
//  SnapCarousel.swift
//  prototype5
//
//  Created by xtabbas on 5/7/20.
//  Copyright © 2020 xtadevs. All rights reserved.
//

import SwiftUI
import Kingfisher

struct SnapCarousel: View {
    @EnvironmentObject var UIState: UIStateModel
    var stories: [Story]?
    var showPlaceholder = false
    
    var body: some View {
        let spacing: CGFloat = 16
        let widthOfHiddenCards: CGFloat = 32 /// UIScreen.main.bounds.width - 10
        let cardHeight: CGFloat = 130
        
        var items: [Card] = []
        if let stories = self.stories {
            for i in 0..<stories.count {
                items.append(Card(id: i, name: stories[i].title, imageString: stories[i].imageURLString))
            }
        }
            
        if showPlaceholder {
            return AnyView(HStack {
                Spacer()
                Image("image_placeholder")
                    .frame(width: 60, height: 60 )
                    .cornerRadius(7.0)
                Spacer()
            }
            .redacted(reason: .placeholder)
            )
        }
        
        return AnyView(Canvas {
            Carousel(
                numberOfItems: CGFloat(items.count),
                spacing: spacing,
                widthOfHiddenCards: widthOfHiddenCards
            ) {
                ForEach(0..<items.count, id: \.self) { index in
                    Item(
                        _id: items[index].id,
                        spacing: spacing,
                        widthOfHiddenCards: widthOfHiddenCards,
                        cardHeight: cardHeight
                    ) {
                        ItemView(story: stories?[index] ?? .placeholder(id: 0))
                    }
                    .foregroundColor(Color.white)
                    .background(Color("surface"))
                    .cornerRadius(8)
                    .transition(AnyTransition.slide)
                    .animation(.spring())
                }
            }
        })
    }
}

struct ItemView: View {
    var story: Story
    @State private var showStoryDetail = false
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                ZStack {
                    Button(action: {
                        showStoryDetail.toggle()
                    }, label: {
                        KFImage(URL(string: story.imageURLString))
                            .placeholder({
                                Image("image_placeholder")
                                    .frame(width: 60, height: 60 )
                                    .cornerRadius(7.0)
                            })
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width, height: proxy.size.height )
                            .clipped()
                            .cornerRadius(7.0)
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    .fullScreenCover(isPresented: $showStoryDetail, content: {
                        NavigationView {
                            StoryView().environmentObject(StoryViewModel(story: story))
                        }
                    })
                    
                }
            }
        }
    }
}

struct Card: Decodable, Hashable, Identifiable {
    var id: Int
    var name: String = ""
    var imageString: String
}

public class UIStateModel: ObservableObject {
    @Published var activeCard: Int = 0
    @Published var screenDrag: Float = 0.0
}

struct Carousel<Items : View> : View {
    let items: Items
    let numberOfItems: CGFloat //= 8
    let spacing: CGFloat //= 16
    let widthOfHiddenCards: CGFloat //= 32
    let totalSpacing: CGFloat
    let cardWidth: CGFloat
    
    @GestureState var isDetectingLongPress = false
    
    @EnvironmentObject var UIState: UIStateModel
        
    @inlinable public init(
        numberOfItems: CGFloat,
        spacing: CGFloat,
        widthOfHiddenCards: CGFloat,
        @ViewBuilder _ items: () -> Items) {
        
        self.items = items()
        self.numberOfItems = numberOfItems
        self.spacing = spacing
        self.widthOfHiddenCards = widthOfHiddenCards
        self.totalSpacing = (numberOfItems - 1) * spacing
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2) //279
        
    }
    
    var body: some View {
        let totalCanvasWidth: CGFloat = (cardWidth * numberOfItems) + totalSpacing
        let xOffsetToShift = (totalCanvasWidth - UIScreen.main.bounds.width) / 2
        let leftPadding = widthOfHiddenCards + spacing
        let totalMovement = cardWidth + spacing
                
        let activeOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard))
        let nextOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard) + 1)

        var calcOffset = Float(activeOffset)
        
        if (calcOffset != Float(nextOffset)) {
            calcOffset = Float(activeOffset) + UIState.screenDrag
        }
        
        return HStack(alignment: .center, spacing: spacing) {
            items
        }
        .offset(x: CGFloat(calcOffset), y: 0)
        .gesture(DragGesture().updating($isDetectingLongPress) { currentState, gestureState, transaction in
            self.UIState.screenDrag = Float(currentState.translation.width)
            
        }.onEnded { value in
            self.UIState.screenDrag = 0
            
            if (value.translation.width < -50) {
                self.UIState.activeCard = self.UIState.activeCard + 1
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            }
            
            if (value.translation.width > 50) {
                self.UIState.activeCard = self.UIState.activeCard - 1
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            }
        })
    }
}

struct Canvas<Content : View> : View {
    let content: Content
    @EnvironmentObject var UIState: UIStateModel
    
    @inlinable init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct Item<Content: View>: View {
    @EnvironmentObject var UIState: UIStateModel
    let cardWidth: CGFloat
    let cardHeight: CGFloat

    var _id: Int
    var content: Content

    @inlinable public init(
        _id: Int,
        spacing: CGFloat,
        widthOfHiddenCards: CGFloat,
        cardHeight: CGFloat,
        @ViewBuilder _ content: () -> Content
    ) {
        self.content = content()
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2) //279
        self.cardHeight = cardHeight
        self._id = _id
    }

    var body: some View {
        content
            .frame(width: cardWidth, height: _id == UIState.activeCard ? cardHeight : cardHeight - 60, alignment: .center)
    }
}
