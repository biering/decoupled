//
//  XibLoadable.swift
//  swift-component
//
//  Created by Christoph Biering on 20.03.19.
//

import UIKit

protocol XibLoadable: Stretchable {
    func unpackXib()
}

extension XibLoadable where Self: UIView {
    
    func unpackXib() {
        let view = loadFromNib()
        addSubview(view)
        stretch(view)
    }
    
    private func loadFromNib<T: UIView>() -> T {
        let selfType = type(of: self)
        let bundle = Bundle(for: selfType)
        let nibName = String(describing: selfType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? T else {
            fatalError("Error loading nib with name \(nibName)")
        }
        
        return view
    }
    
}

