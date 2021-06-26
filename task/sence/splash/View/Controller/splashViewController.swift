//
//  splashViewController.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import UIKit

class splashViewController: BaseViewController {

    var presenter: splashPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSplashScreen()
    }
    private func loadSplashScreen()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.presenter?.goToHomePage()
        }
    }

}
