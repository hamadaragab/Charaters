//
//  HomePresenter.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
class  HomePresenter: BasePresenter {
    weak var view: HomeViewProtocol?
    var router: HomeRouter
    var interactor: HomeInteractor
    var Characters_Model: [CharactersModel] =  [CharactersModel]()
    var isloading = false
    var isMoreCharacter = true
    init(view: HomeViewProtocol?,router: HomeRouter,interactor: HomeInteractor)
    {
        self.router = router
        self.view = view
        self.interactor = interactor
    }
}

extension HomePresenter: HomePresenterProtocol{
    // APIS
    func getCharacters(limit: Int, offset: Int) {
        isloading = true
        interactor.getCharacters(limit: limit, offset: offset) { (result) in
            self.isloading = false
            switch result {
            case .failure(let error):
                print("error",error.localizedDescription)
            case .success(let model):
                if model.count < 20 {
                    self.isMoreCharacter = false
                }
                self.ConfigureModelData(characters: model)
            }
        }
    }
    // Router
    func goToCharacterDetails()
    {
       
    }
    // Configure TableView
    func configureCell(index: Int, cell: charaterCellProtocol){
        print("Cell",index)
        let currentCellData = Characters_Model[index]
        cell.characterName(name: currentCellData.name ?? "")
        cell.displayCharacter(image: currentCellData.img ?? "")
    }
    func didSelectRow(index: Int) {
        print("Cell",index)
        router.goToCharacterDetails(view: view, CharactersModel: Characters_Model, selectedIndex: index)
    }
    func returnCharactersCount() -> Int {
        print("DataCount",Characters_Model.count)
        return Characters_Model.count
    }
    // puplic Function
    func isLoadingCharacters() -> Bool {
        return isloading
    }
    func isMoreCharacters() -> Bool {
        return isMoreCharacter
    }
    private func ConfigureModelData(characters: [CharactersModel])
    {
        for character in characters {
            print(character)
        Characters_Model.append(character)
    }
            self.view?.reloadTableView()
    }
}
