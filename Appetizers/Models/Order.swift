//
//  Order.swift
//  Appetizers
//
//  Created by motomura on 2024/05/12.
//

import Foundation

final class Order: ObservableObject {
    //MARK: - Properties
    
    @Published var items: [Appetizer] = []
    
    
    //MARK: - Computed Properties
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    
    //MARK: - Functions
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
