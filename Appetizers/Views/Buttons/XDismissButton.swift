//
//  XDismissButton.swift
//  Appetizers
//
//  Created by motomura on 2024/05/12.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 30, height: 30)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    XDismissButton()
}
