//
//  StoryHeaderView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 14/06/2021.
//

import SwiftUI
import RemoteImageView

struct StoryHeaderView: View {
    @State var story: Story
    @State var height: CGFloat = 230.0
    
    var body: some View {
        VStack(alignment: .center) {
            //Color.clear.frame(height: 100)
           // Spacer()
            HStack (alignment: .center) {
                // thumbnail
                RemoteImageView(stringURL: story.featureImage)
                    .scaledToFit()
                    .frame(width: 91, height: 109)
                    .clipped()
                    .cornerRadius(7.0)
                
                VStack (alignment: .leading, spacing: 13){
                    Text(story.title)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                    
                    // star view
                    StarView(point: 4.5)
                        .frame(width: 110, height: 12)
                    
                    HStack (spacing: 20){
                        // view
                        HStack {
                            Image("view")
                                .resizable()
                                .frame(width: 16, height: 9)
                            
                            Text("1.560")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.white)
                        }
                        
                        HStack {
                            Image("like")
                                .resizable()
                                .frame(width: 12, height: 10)
                            
                            Text("150")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.white)
                        }
                        
                        HStack {
                            Image("love")
                                .resizable()
                                .frame(width: 11, height: 10)
                            
                            Text("950")
                                .font(.system(size: 9, weight: .regular))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 7)
                }
                
                Spacer()
            }
            //Spacer()
            
        }
        //.background(self.background)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))        
    }
    
    var background: some View {
        RemoteImageView(stringURL: story.featureImage)
            .scaledToFill()
            //.aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width, height: height)
            .clipped()
            .background(Color.black)
            .blur(radius: 3, opaque: true)
        
    }
}

struct StoryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StoryHeaderView(story: SampleData.stories()[1])
            .frame(height: 230)
    }
}
