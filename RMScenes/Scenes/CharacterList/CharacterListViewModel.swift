//
//  CharacterListViewModel.swift
//  RMScenes
//
//  Created by SemihTOY on 6.09.2023.
//

import Foundation
import RMNetwork
import RMEntities
import Combine

class CharacterListViewModel {
  let characterListUseCase: CharacterListUseCaseType
  @Published var characterListResponse: CharacterListResponse?

  init(characterListUseCase: CharacterListUseCaseType) {
    self.characterListUseCase = characterListUseCase

    getCharacterList(pageCount: 5)
  }

  func getCharacterList(pageCount: Int) {
    var parameters: [String: Any] = [:]
    parameters["page"] = "\(pageCount)"
    characterListUseCase.getCharacterList(parameters: parameters) { [weak self] result in
      switch result {
      case .success(let response):
        self?.characterListResponse = response
      case .failure(_):
        print("error")
      }
    }
  }
}
