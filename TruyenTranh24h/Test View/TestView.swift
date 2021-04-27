//
//  TestView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 15/04/2021.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView {
                Button("Scroll to bottom") {
                    scrollView.scrollTo(99, anchor: .center)
                }
                
                ForEach(0..<100) { index in
                    Text(String(index))
                        .id(index)
                }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

