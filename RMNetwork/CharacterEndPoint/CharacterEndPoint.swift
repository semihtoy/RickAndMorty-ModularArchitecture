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
  case characterDetail(parameters: String)

  var characterURL: String {
    return "api/character"
  }

  var method: HTTPMethod {
    switch self {
    case .characterList:
      return .get
    case .characterDetail:
      return .get
    }
  }

  var path: String {
    switch self {
    case .characterList:
      return characterURL
    case .characterDetail(let parameters):
      return characterURL + "/\(parameters)"
    }
  }

  var parameters: Parameters? {
    switch self {
    case .characterList(let params):
      return params
    case .characterDetail:
      return nil
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
