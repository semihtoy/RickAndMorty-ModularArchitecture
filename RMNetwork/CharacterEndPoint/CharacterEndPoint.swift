//
//  CharacterEndPoint.swift
//  RMNetwork
//
//  Created by SemihTOY on 6.09.2023.
//

import Foundation
import Alamofire

enum CharacterEndPoint: BaseRequest {
  
  case characterList(parameters: [String: Any])

  var characterURL: String {
    return "api/character"
  }

  var method: HTTPMethod {
    switch self {
    case .characterList:
      return .get
    }
  }

  var path: String {
    switch self {
    case .characterList:
      return characterURL
    }
  }

  var parameters: Parameters? {
    switch self {
    case .characterList(let params):
      return params
    }
  }

  func asURLRequest() throws -> URLRequest {
    let url = try ServiceConstant.baseURL.asURL()
    var urlRequest = URLRequest(url: url.appendingPathComponent(path))
    urlRequest.httpMethod = method.rawValue

    let encoding: ParameterEncoding = {
      switch method {
      case .post:
        return JSONEncoding.default
      default:
        return URLEncoding.default
      }
    }()
    print(urlRequest)
    return try encoding.encode(urlRequest, with: parameters)
  }
}
