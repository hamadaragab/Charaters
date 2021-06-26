//
//  UiiamgeView.swift
//  task
//
//  Created by Apple on 6/26/21.
//

import Kingfisher
import UIKit
extension UIImageView {
    
    func loadImageFrom(imgUrl: String,placeholder:String = "") {
//        let strUrl = "\(url)/\(imgUrl)".replacingOccurrences(of: "\\", with: "/")
        
//        print("imagess",strUrl)
        if let url = URL(string: imgUrl){
           self.kf.setImage(with: url, placeholder: UIImage(named: ""), options: [.transition(.fade(0.2))])
        }else{
            print("image url: nil \(imgUrl)")
        }
       }
    
}
