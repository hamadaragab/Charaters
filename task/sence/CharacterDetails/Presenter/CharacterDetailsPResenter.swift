//
//  CharacterDetailsPResenter.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
class  CharacterDetailsPresenter: BasePresenter {
   weak var view: CharacterDetailsViewProtocol?
    var router: CharacterDetailsRouter
    var Characters_Model: [CharactersModel] =  [CharactersModel]()
    var selectedIndex = 0
    init(view: CharacterDetailsViewProtocol?,router: CharacterDetailsRouter,Characters_Model: [CharactersModel],selectedIndex: Int)
    {
        self.router = router
        self.view = view
        self.Characters_Model = Characters_Model
        self.selectedIndex = selectedIndex
    }
    }

extension CharacterDetailsPresenter: CharacterDetailsPresenterProtocol{
    
    // configure Collection View
    func configureCell(index: Int, cell: characterDetailsCellProtocol) {
        let currentCellData = Characters_Model[index]
        cell.setName(name: currentCellData.name ?? "")
        cell.setNickName(nickName: currentCellData.nickname ?? "")
        guard let occupation = currentCellData.occupation else {
            return
        }
        var occupationWords = ""
        for item in occupation {
            occupationWords.append(item + " ")
        }
        cell.setDescription(description: occupationWords)
        cell.setCharacterPhoto(photo: currentCellData.img ?? "")
    }
    
    func returnNumberOfCharacter() -> Int {
        return Characters_Model.count
    }
    
    func returnSelectedIndex() -> Int {
        return selectedIndex
    }
    // Router
    func goBack() {
        router.goBack(view: view)
    }
    
}
