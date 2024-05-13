//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by motomura on 2024/05/11.
//

import SwiftUI

struct AppetizerListView: View {
    
    // MARK: - Properties
    @StateObject private var viewModel = AppetizerListViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            NavigationStack {
                // MARK: - List of Appetizers
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
//            .onAppear {
//                viewModel.getAppetizers()
//            }
            .task {
                await viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowingDetail: $viewModel.isShowingDetail)
            }//: If
            
            if viewModel.isLoading {
                LoadingView()
            }//: If
            
        }
        .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title,
                      message: alert.message,
                      dismissButton: alert.dismissButton)
            }
    }
}

#Preview {
    AppetizerListView()
}
