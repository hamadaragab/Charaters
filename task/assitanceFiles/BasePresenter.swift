//
//  BasePresenter.swift
//  task
//
//  Created by Apple on 6/25/21.
//

import Foundation
class BasePresenter: basePresenterProtocols{
    func showError(error: String){
        print("error", error)
    }
    
}
extension BasePresenter{
    func showAlertError(error: String) {
        self.showError(error: error)
    }
}

