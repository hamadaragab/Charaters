//
//  splashProtocol.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
protocol  splashViewProtocol: baseViewProtocols {
    var presenter: splashPresenterProtocol? {get set}
}

protocol  splashPresenterProtocol: basePresenterProtocols {
    var view:  splashViewProtocol? {get set}
    func goToHomePage()
    
  
}
