//
//  Stretchable.swift
//  swift-component
//
//  Created by Christoph Biering on 21.03.19.
//

import UIKit

protocol Stretchable {
    func stretch(_ view: UIView)
}

extension Stretchable where Self: UIView {
    
    func stretch(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leftAnchor.constraint(equalTo: leftAnchor),
            view.rightAnchor.constraint(equalTo: rightAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
