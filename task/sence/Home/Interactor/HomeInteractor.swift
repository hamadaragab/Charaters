//
//  HomeEndpoint.swift
//  task
//
//  Created by Apple on 6/25/21.
// 

import Foundation
import Alamofire
class HomeInteractor {
    func getCharacters(limit: Int,offset: Int,completion: @escaping (Result<[CharactersModel], AFError>)-> Void)
    {
        APIClient.performRequest(route: HomeEndpoint.getCharacters(limit: limit,offset: offset), completion: completion)
    }
}
