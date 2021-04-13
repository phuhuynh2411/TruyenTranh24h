//
//  StoryThumbnail.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 13/04/2021.
//

import SwiftUI

struct StoryThumbnailView: View{
    
    var body: some View {
        VStack{
            ZStack(alignment: .topLeading){
                Image("trongsinh_thumbnail")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(5.0)
                
                
                // Top buttoms
                HStack(){
                    // Chapter
                    Text("Chương 1")
                        .padding(2)
                        .foregroundColor(Color("chapterButtonFg"))
                        .background(Color("chapterButtonBg"))
                        .cornerRadius(3.0)
                        .padding(5)
                    
                    // Add space
                    Spacer()
                    
                    // Hot button
                    Text("Hot")
                        .padding(2)
                        .foregroundColor(Color("hotButtonFg"))
                        .background(Color("hotButtonBg"))
                        .cornerRadius(3.0)
                        .padding(5)
                }
               
                
            }
            
            
            
            Text("Trọng sinh ta sau tám vạn năm")
        }
        
        
    }
}

struct StoryThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StoryThumbnailView()
        }
    }
}
