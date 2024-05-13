//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by motomura on 2024/05/11.
//

import SwiftUI

@main
struct AppetizersApp: App {
    // MARK: - Properties
    
    var order = Order()
    
    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
