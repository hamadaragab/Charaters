//
//  CharacterDetailsRouter.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
import UIKit
class CharacterDetailsRouter: BaseRouter {
    
    class func CreateCharacterDetailsViewController(CharactersModel: [CharactersModel],selectedIndex: Int)-> UIViewController {
        let CharacterDetailsView = CharacterDetailsViewController.loadFromStoryboard(name: "CharacterDetailsStoryboard")
        let view = CharacterDetailsView as? CharacterDetailsViewProtocol
        let router = CharacterDetailsRouter()
        let presenter = CharacterDetailsPresenter(view: view,router: router, Characters_Model: CharactersModel, selectedIndex: selectedIndex)
        view?.presenter = presenter
        return CharacterDetailsView
    }
    func goBack(view: CharacterDetailsViewProtocol?){
        popViewController(view: view  as? UIViewController)
        
    }
}
