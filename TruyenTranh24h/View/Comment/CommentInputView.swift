//
//  CommentInputView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 18/06/2021.
//

import SwiftUI
import RemoteImageView

struct CommentInputView: View {
    var textValue: Binding<String>
    
    var body: some View {
        HStack(spacing: 13) {
            // user avatar
            RemoteImageView(stringURL: "")
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            
            ZStack {
                HStack {
                    Spacer()
                    Button(action: {}, label: {
                        Image("smile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 14, height: 14)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
                            .foregroundColor(.red)
                    })
                }
                
                TextField("enter-comment", text: textValue)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 32))
                    .font(.system(size: 10, weight: .light))
                    .frame(height: 32)
                
            }
            .background(Color("textFieldBg"))
            .cornerRadius(16.0)
            
            // Send button
            Button(action: {}, label: {
                Image("send")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 16, height: 16)
            })
        }
    }
}

struct CommentInputView_Previews: PreviewProvider {
    @State static var text: String = ""
    static var previews: some View {
        CommentInputView(textValue: $text)
           
    }
}
