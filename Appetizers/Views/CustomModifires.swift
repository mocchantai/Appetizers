//
//  CustomModifires.swift
//  Appetizers
//
//  Created by motomura on 2024/05/12.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}

struct ListCellImageStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 120, height: 90)
            .cornerRadius(8)
    }
}

extension View {
    func listCellImageStyle () -> some View {
        self.modifier(ListCellImageStyle())
    }
}
