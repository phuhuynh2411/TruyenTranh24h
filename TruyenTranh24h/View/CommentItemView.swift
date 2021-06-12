//
//  CommentItemView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 12/06/2021.
//

import SwiftUI

struct CommentItemView: View {
    var body: some View {
        HStack(spacing: 16) {
            // avatar
            Image("avatar")
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 10) {
                // title
                Text("Cras Etiam Adipiscing Purus")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.black)
                
                // description
                Text("Donec sed odio dui. Donec id elit non mi porta gravida at eget metus.")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color("commentDescriptionTextFg"))
                
                HStack (spacing: 30) {
                    // date and time
                    Text("25/11/2021 10:30")
                        .font(.system(size: 9, weight: .light))
                        .foregroundColor(Color("commentDateFg"))
                    
                    // answer button
                    Button(action: {}, label: {
                        Text("Answer")
                            .font(.system(size: 9, weight: .regular))
                            .foregroundColor(Color("answerButtonFg"))
                    })
                    
                }
            }
        }
    }
}

struct CommentItemView_Previews: PreviewProvider {
    static var previews: some View {
        CommentItemView()
    }
}
