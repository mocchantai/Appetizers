//
//  EmptyState.swift
//  Appetizers
//
//  Created by motomura on 2024/05/12.
//

import SwiftUI

struct EmptyState: View {
    //MARK: - Properties
    
    let imageName: String
    let message: String
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -48)
            
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order",
               message: "You have no items in your order. \nPlease add an appetizer.")
}
