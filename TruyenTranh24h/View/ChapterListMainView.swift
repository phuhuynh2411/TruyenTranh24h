//
//  ChapterListMainView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 27/08/2021.
//

import SwiftUI

struct ChapterListMainView: View {
    @EnvironmentObject var listChapterModelView: ListChapterViewModel
    
    var body: some View {
        VStack {
            TopView()
                .frame(height: 50)
            
            ScrollView {
                ChapterListView(chapterListModelView: listChapterModelView)
            }
        }
        .navigationBarHidden(true)
    }
    
    private struct TopView: View {
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
        var body: some View {
            ZStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        BackButtonView()
                            .foregroundColor(.gray)
                            .padding(.leading, 16)
                    })
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("chapter")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
            }
        }
    }
}

struct ChapterListMainView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterListMainView()
    }
}
