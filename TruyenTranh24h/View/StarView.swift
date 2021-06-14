//
//  StarView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 14/06/2021.
//

import SwiftUI

struct StarView: View {
    @State var point: CGFloat
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor( point >= 1 ? Color("starFg") : .white)
                
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor( point >= 2 ? Color("starFg") : .white)
                
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor( point >= 3 ? Color("starFg") : .white)
                
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor( point >= 4 ? Color("starFg") : .white)
                
                Image(systemName: "star.fill")
                    .resizable()
                    .foregroundColor( point >= 5 ? Color("starFg") : .white)
                
            }
            // point
            Text(point.description)
                .font(.system(size: 9, weight: .regular))
                .foregroundColor(.white)
        }
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StarView(point: 0)
            
            StarView(point: 1)
            
            StarView(point: 2)
            
            StarView(point: 3)
            
            StarView(point: 4)
            
            StarView(point: 5.1)
                .frame(width: 80, height: 9)
        }
        .background(Color.blue)
        .frame(height: 300)
        
    }
}
