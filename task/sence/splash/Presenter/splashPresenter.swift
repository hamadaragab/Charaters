//
//  splashPResenter.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
class  splashPresenter: BasePresenter {
   weak var view: splashViewProtocol?
    var router: splashRouter
    init(view: splashViewProtocol?,router: splashRouter)
    {
        self.router = router
        self.view = view
    }
    }

extension splashPresenter: splashPresenterProtocol{
    func goToHomePage() {
        router.goToHomePage(view: view)
    }
}
