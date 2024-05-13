//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by motomura on 2024/05/11.
//

import SwiftUI



struct AppetizerListCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .scaledToFit()
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .listCellImageStyle()
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .listCellImageStyle()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 8)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
