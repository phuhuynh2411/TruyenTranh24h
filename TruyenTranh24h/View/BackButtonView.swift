//
//  BackButtonView.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 19/06/2021.
//

import SwiftUI

struct BackButtonView: View {

    var body: some View {
        HStack {
            Image(systemName: "chevron.backward")
                .resizable()
                .renderingMode(.template)
                .frame(width: 10, height: 19)
            
            Spacer()
        }
        .frame(width: 40, height: 30)
    }
    
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
            .foregroundColor(.red)
    }
}
