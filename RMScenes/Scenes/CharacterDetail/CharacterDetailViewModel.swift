//
//  CharacterDetailViewModel.swift
//  RMScenes
//
//  Created by SemihTOY on 13.09.2023.
//

import Foundation
import RMNetwork
import RMEntities
import Combine

class CharacterDetailViewModel {
  let characterDetailUseCase = CharacterDetailUseCase()
  let characterId: String
  @Published var characterDetailResponse: CharacterDetailResponse?
  
  init(characterId: String) {
    self.characterId = characterId
    getCharacterDetail()
  }

  private func getCharacterDetail() {
    characterDetailUseCase.getCharacterDetail(parameters: characterId) { [weak self] result in
      switch result {
      case .success(let response):
        self?.characterDetailResponse = response
      case .failure(_):
        print("error")
      }
    }
  }


}
