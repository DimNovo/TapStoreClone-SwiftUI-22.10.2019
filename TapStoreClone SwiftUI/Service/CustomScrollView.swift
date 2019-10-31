//
//  CustomScrollView.swift
//  TapStoreClone SwiftUI
//
//  Created by Dmitry Novosyolov on 31/10/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

final class ScrollViewCoordinator: UIViewController {
    
    var hostingController = UIHostingController(rootView: AnyView(EmptyView()))
    
    func addChildView() {
        
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        self.view.addSubview(scrollView)
        self.addConstraints(from: scrollView, to: view)
        scrollView.addSubview(self.hostingController.view)
        self.addConstraints(from: self.hostingController.view, to: scrollView)
        scrollView.layoutIfNeeded()
    }
    
    private func addConstraints(from childView: UIView, to parentView: UIView) {
        
        childView.translatesAutoresizingMaskIntoConstraints = false
        parentView.addConstraints([
            childView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            childView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            childView.topAnchor.constraint(equalTo: parentView.topAnchor),
            childView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
            ]
        )
    }
}

struct CustonScrollView<Content: View>: UIViewControllerRepresentable {
    
    private var content: Content
    
    init(@ViewBuilder content: () -> Content) { self.content = content()}
    
    func makeCoordinator() -> ScrollViewCoordinator { return Coordinator()}
    
    func makeUIViewController(context: Context) -> ScrollViewCoordinator {
        let scrollViewCoordinator = Coordinator()
        scrollViewCoordinator.hostingController.rootView = AnyView(self.content)
        return scrollViewCoordinator
    }
    
    func updateUIViewController(_ uiViewController: ScrollViewCoordinator, context: Context) {
        uiViewController.addChildView()
    }
}
