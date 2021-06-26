//
//  File.swift
//  task
//
//  Created by Apple on 6/26/21.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var query: [URLQueryItem]? { get }
    var parameters: Parameters? { get }
}
