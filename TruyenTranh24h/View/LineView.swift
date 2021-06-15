//
//  LineView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 15/06/2021.
//

import SwiftUI

struct LineView: View {
    var body: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(Color("lineFg"))
    }
}

struct LineView_Previews: PreviewProvider {
    static var previews: some View {
        LineView()
    }
}
