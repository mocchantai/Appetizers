//
//  LoadingView.swift
//  Appetizers
//
//  Created by motomura on 2024/05/11.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.brandPrimary
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
//            ActivityIndicator()
            
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
                .scaleEffect(2)
        }
    }
}
