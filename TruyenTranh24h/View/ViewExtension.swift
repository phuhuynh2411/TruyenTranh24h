//
//  ViewExtension.swift
//  TruyenTranh24h
//
//  Created by Huynh Tan Phu on 17/06/2021.
//

import SwiftUI

extension View {
    func scrollOffSet(offset: Binding<CGFloat>) -> some View {
        modifier(ScrollOffSetViewModifier(offset: offset))
    }
}
