//
//  BaseRequest.swift
//  RMNetwork
//
//  Created by SemihTOY on 6.09.2023.
//

import Foundation
import Alamofire

protocol BaseRequest: URLRequestConvertible {
  var method: HTTPMethod { get }
  var path: String { get }
  var parameters: Parameters? { get }
}
