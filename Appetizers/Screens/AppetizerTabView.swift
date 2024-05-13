//
//  ContentView.swift
//  Appetizers
//
//  Created by motomura on 2024/05/11.
//

import SwiftUI

struct AppetizerTabView: View {
    //MARK: - Properties
    
    @EnvironmentObject var order: Order
    
    //MARK: - Body
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(order.items.count)
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
        }
    }
}

#Preview {
    AppetizerTabView().environmentObject(Order())
}
