//
//  StoryboardLoadable.swift
//  swift-component
//
//  Created by Christoph Biering on 21.03.19.
//

import UIKit

protocol StoryboardLoadable {
    static var StoryboardName: String { get }
}

extension StoryboardLoadable where Self: UIViewController {
    
    static var StoryboardName: String { return String(describing: self) }
    
    static func instantiate() -> Self {
        return instantiateWithName(name: StoryboardName)
    }
    
    static func instantiateWithName(name: String) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        
        guard let vc = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("failed to load \(name) storyboard file.")
        }
        
        return vc
    }
}
