//
//  HomeProtocols.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
protocol  HomeViewProtocol: baseViewProtocols {
    var presenter: HomePresenterProtocol? {get set}
    func reloadTableView()
}

protocol  HomePresenterProtocol: basePresenterProtocols {
    var view:  HomeViewProtocol? {get set}
    func getCharacters(limit: Int, offset: Int)
    func didSelectRow(index: Int)
    func configureCell(index: Int, cell: charaterCellProtocol)
    func returnCharactersCount()-> Int
    func isLoadingCharacters() -> Bool
    func isMoreCharacters() -> Bool
}
