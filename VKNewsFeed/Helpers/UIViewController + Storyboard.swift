//
//  UIViewController + Storyboard.swift
//  VKNewsFeed
//
//  Created by Mihails Kuznecovs on 09/07/2019.
//  Copyright © 2019 Mihails Kuznecovs. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        }
        else {
            fatalError("Error: no initial ViewController in \(name) storyboard")
        }
    }
}
