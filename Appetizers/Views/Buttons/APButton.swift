//
//  APButton.swift
//  Appetizers
//
//  Created by motomura on 2024/05/12.
//

import SwiftUI

struct APButton: View {
    // MARK: - Properties
    
    let title: LocalizedStringKey
    
    // MARK: - Body
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(Color.brandPrimary)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    APButton(title: "Add to Order")
        .previewLayout(.sizeThatFits)
        .padding()
}
