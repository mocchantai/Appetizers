//
//  OrderView.swift
//  Appetizers
//
//  Created by motomura on 2024/05/11.
//

import SwiftUI

struct OrderView: View {
    //MARK: - Properties
    
    @EnvironmentObject var order: Order
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - List of Appetizers
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }//: List
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("Order placed")
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
//                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }//: Button
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 24)
                }//: VStack
                
                // MARK: - Empty State
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order. \nPlease add an appetizer.")
                }//: If
            }
            .navigationTitle("🛒Order")
        }//: NavigationStack
    }//: Body
}

#Preview {
    OrderView().environmentObject(Order())
}
