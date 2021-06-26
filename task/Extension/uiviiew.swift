//
//  uiviiew.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
import UIKit

extension UIView {
    func setShadow()
    {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.shadowColor.cgColor
        self.layer.shadowOffset =  CGSize.zero
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4


    }

}
