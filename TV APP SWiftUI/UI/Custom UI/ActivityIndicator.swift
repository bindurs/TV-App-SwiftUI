//
//  ProgressView.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 16/02/21.
//

import Foundation
import  SwiftUI

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        let control = UIActivityIndicatorView(style: style)
        control.color = .white
        control.hidesWhenStopped = true
        return control
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
