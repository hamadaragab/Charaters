//
//  HomeInteractor.swift
//  task
//
//  Created by Apple on 6/25/21.
//  Interactor

import Foundation
import Alamofire
enum HomeEndpoint: APIConfiguration {
    case getCharacters(limit: Int,offset: Int)

    var method: HTTPMethod
    {
        switch self {
        case .getCharacters:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "characters"
        }
    }
    
    var query: [URLQueryItem]?
    {
        switch self {
        case .getCharacters(let limit,let offset):
            return [URLQueryItem(name: "limit", value: "\(limit)"),URLQueryItem(name: "offset", value: "\(offset)")]
        }
    }
    
    var parameters: Parameters?
    {
        return nil
    }
    
    
    func asURLRequest() throws -> URLRequest {
        
        var url = try Constants.shared.baseUrl.asURL()
         if let query = query {
             var urlComponents = URLComponents(string: url.absoluteString)
             urlComponents?.queryItems = query
             url = try (urlComponents?.asURL())!
         }
         
         var urlRequest = URLRequest(url: url.appendingPathComponent(path))
         urlRequest.httpMethod = method.rawValue
         if let parameters = parameters {
             do {
                 urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                 
             }
             catch {
                 throw AFError.parameterEncodingFailed(reason: AFError.ParameterEncodingFailureReason.jsonEncodingFailed(error: error))
             }
         }
        print("urlRequest",urlRequest)
         return urlRequest
     }
     
    }
 
