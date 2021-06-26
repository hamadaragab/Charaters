//
//  HomeRouter.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
import UIKit
class HomeRouter: BaseRouter {
    
    class func CreateHomeViewController()-> UIViewController {
        let HomeView = HomeViewController.loadFromStoryboard(name: "HomeStoryboard")
        let view = HomeView as? HomeViewProtocol
        let router = HomeRouter()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view,router: router, interactor: interactor)
        view?.presenter = presenter
        return HomeView
    }
    func goToCharacterDetails(view: HomeViewProtocol?, CharactersModel: [CharactersModel],selectedIndex: Int){
        let CharacterDetailsView = CharacterDetailsRouter.CreateCharacterDetailsViewController(CharactersModel: CharactersModel,selectedIndex: selectedIndex)
        pushViewController(nextView: CharacterDetailsView , view: view as? UIViewController)
        
    }
}
