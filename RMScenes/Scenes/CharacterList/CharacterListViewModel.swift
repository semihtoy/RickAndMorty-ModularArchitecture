//
//  CharacterListViewModel.swift
//  RMScenes
//
//  Created by SemihTOY on 6.09.2023.
//

import Foundation
import RMNetwork

class CharacterListViewModel {

  let characterListUseCase: CharacterListUseCase

  init(characterListUseCase: CharacterListUseCase) {
    self.characterListUseCase = characterListUseCase

    getCharacterList(pageCount: 5)
  }

  func getCharacterList(pageCount: Int) {
    var parameters: [String: Any] = [:]
    parameters["page"] = "\(pageCount)"
    characterListUseCase.getCharacterList(parameters: parameters) { result in
      switch result {
      case .success(let response):
        print("response")
      case .failure(let error):
        print("error")
      }
    }
  }
}
