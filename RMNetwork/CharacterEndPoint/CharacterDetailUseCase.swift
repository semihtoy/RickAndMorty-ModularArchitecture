//
//  CharacterDetailUseCase.swift
//  RMNetwork
//
//  Created by SemihTOY on 13.09.2023.
//

import Foundation
import RMEntities

protocol CharacterDetailUseCaseType {
  func getCharacterDetail(parameters: String, completion: @escaping((Result<CharacterDetailResponse, Error>)) -> Void)
}

public struct CharacterDetailUseCase: CharacterDetailUseCaseType {
  public init() {
  }
  public func getCharacterDetail(parameters: String, completion: @escaping((Result<CharacterDetailResponse, Error>)) -> Void) {
    return BaseService.request(CharacterEndPoint.characterDetail(parameters: parameters), completion: completion)
  }
}
