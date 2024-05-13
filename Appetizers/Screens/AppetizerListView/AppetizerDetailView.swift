//
//  AppetizerDetailCard.swift
//  Appetizers
//
//  Created by motomura on 2024/05/11.
//

import SwiftUI

struct AppetizerDetailView: View {
    // MARK: - Properties
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    // MARK: - Body
    var body: some View {
            VStack {
                // MARK: - Appetizer Image
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .scaledToFit()
                
                // MARK: - Appetizer Info
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                
                Text(appetizer.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
                
                // MARK: - Nutrition Info
                HStack(spacing: 40) {
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                }//: HStack
                
                Spacer()
                
                // MARK: - Button
                Button {
                    order.add(appetizer)
                    isShowingDetail.toggle()
                } label: {
                    Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                }
//                .modifier(StandardButtonStyle())
                .standardButtonStyle()
                .padding(.bottom, 30)
            }//: VStack
            .frame(width: 320, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button {
                isShowingDetail.toggle()
            } label: {
                XDismissButton()
            }, alignment: .topTrailing)
    }//: body
}

// MARK: - Preview
#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                        isShowingDetail: Binding.constant(true))
        .environmentObject(Order())
}

struct NutritionInfo: View {
    // MARK: - PROPERTIES
    
    let title: String
    let value: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption)
            Text("\(value)g")
                .italic()
                .foregroundColor(.secondary)
        }
    }
}
