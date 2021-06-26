//
//  HomeViewExxtension.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
import UIKit
extension HomeViewController: HomeViewProtocol{
    func reloadTableView() {
        characterListTableView.reloadData()
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource,UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.returnCharactersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCellIdentifier, for: indexPath) as! charaterCell
        cell.selectionStyle = .none
        presenter?.configureCell(index: indexPath.row, cell: cell)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(index: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let charactersCount = presenter?.returnCharactersCount() ?? 0
        let isloading = presenter?.isLoadingCharacters()
        let isMoreCharacters = presenter?.isMoreCharacters()
        for index in indexPaths {
            if index.row >= charactersCount - 4 && !isloading! && isMoreCharacters!{
                offest = offest + 20
                presenter?.getCharacters(limit: limit, offset: offest)
                break
            }
        }
        
    }
    
}
