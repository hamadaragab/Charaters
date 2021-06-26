//
//  splashRouter.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
import UIKit
class splashRouter: BaseRouter {
    
    class func CreatesplashViewController()-> UIViewController {
        let splashView = splashViewController.loadFromStoryboard(name: "splashStoryboard")
        let view = splashView as? splashViewProtocol
        let router = splashRouter()
        let presenter = splashPresenter(view: view,router: router)
        view?.presenter = presenter
        return splashView
    }
    func goToHomePage(view: splashViewProtocol?){
        
        
        
        UIApplication.shared.windows.first?.rootViewController =
            UINavigationController(rootViewController: HomeRouter.CreateHomeViewController())
        UIApplication.shared.windows.first?.makeKeyAndVisible()
//        popViewController(view: view  as? UIViewController)
        
    }
}
