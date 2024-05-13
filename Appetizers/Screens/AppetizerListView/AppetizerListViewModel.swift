//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by motomura on 2024/05/11.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    //MARK: - Properties
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedAppetizer: Appetizer?
    
    //MARK: - Methods
    
//    func getAppetizers() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async { [self] in
//                isLoading = false
//                switch result {
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidData:
//                        alertItem = AlertContext.invalidData
//                        
//                    case .invalidResponse:
//                        alertItem = AlertContext.invalidResponse
//                        
//                    case .invalidURL:
//                        alertItem = AlertContext.invalidURL
//                        
//                    case .unableToComplete:
//                        alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    
    func getAppetizers() async {
        isLoading = true
        
        do {
            appetizers = try await NetworkManager.shared.getAppetizers()
        } catch {
            if let apError = error as? APError {
                switch apError {
                case .invalidData:
                    alertItem = AlertContext.invalidData
                    
                case .invalidResponse:
                    alertItem = AlertContext.invalidResponse
                    
                case .invalidURL:
                    alertItem = AlertContext.invalidURL
                    
                case .unableToComplete:
                    alertItem = AlertContext.unableToComplete
                }
            } else {
                alertItem = AlertContext.invalidData
            }
        }
        
        isLoading = false
    }
}
