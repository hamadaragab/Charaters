//
//  UiViewController.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
import UIKit
extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
    
    static func loadFromStoryboard(name: String ) -> UIViewController{
        let storyboard = UIStoryboard(name: name.self, bundle: nil)
        
       
        return storyboard.instantiateViewController(withIdentifier: name)
        }
    static func loadFromMain() -> UIViewController
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self))
    }
}
