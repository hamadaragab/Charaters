//
//  CharacterDetailsProtocols.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
protocol  CharacterDetailsViewProtocol: baseViewProtocols {
    var presenter: CharacterDetailsPresenterProtocol? {get set}
}

protocol  CharacterDetailsPresenterProtocol: basePresenterProtocols {
    var view:  CharacterDetailsViewProtocol? {get set}
    func goBack()
    func returnNumberOfCharacter()-> Int
    func returnSelectedIndex()->Int
    func configureCell(index: Int, cell: characterDetailsCellProtocol)

  
}
