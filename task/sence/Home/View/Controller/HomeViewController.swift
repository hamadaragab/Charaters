//
//  HomeViewController.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import UIKit

class HomeViewController: BaseViewController {
    @IBOutlet weak var characterListTableView: UITableView!
    let CharacterCellIdentifier = "charaterCell"
    var limit = 20
    var offest = 0
    var presenter: HomePresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigureView()
        ConfigureTableView()
        presenter?.getCharacters(limit: limit, offset: offest)
    }
    private func ConfigureTableView()
    {
        characterListTableView.delegate = self
        characterListTableView.dataSource = self
        characterListTableView.prefetchDataSource = self
        let charaterCellNib = UINib(nibName: CharacterCellIdentifier, bundle: nil)
        characterListTableView.register(charaterCellNib, forCellReuseIdentifier: CharacterCellIdentifier)
    }
    private func ConfigureView()
    {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}
