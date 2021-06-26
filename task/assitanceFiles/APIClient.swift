//
//  File.swift
//  task
//
//  Created by Apple on 6/26/21.
//

import Foundation
import Alamofire
class APIClient {
    
    //MARK: - peroformRequest without Future
    @discardableResult
    static func performRequest<T: Decodable>(route:APIConfiguration, decoder: JSONDecoder = JSONDecoder(), completion: @escaping (Result<T, AFError>)->Void) -> DataRequest {
        AF.request(route)
            .validate(statusCode: 200...600)
            .responseDecodable(decoder: decoder) { (response: AFDataResponse<T>) in
                 switch response.result {
                case .success(let value):
                    print("value",value)
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    
}
