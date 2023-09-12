//
//  CharacterDetailBuilder.swift
//  RMScenes
//
//  Created by SemihTOY on 13.09.2023.
//

import RMNetwork
import UIKit

class CharacterDetailBuilder {

  private let characterId: String
  init(characterId: String) {
    self.characterId = characterId
  }

  func build() -> UIViewController {
    guard let viewController = UIStoryboard.instantiateViewController(.characterDetail, CharacterDetailViewController.self) else {
        fatalError("Cannot be instantiated")
    }
    viewController.viewModel = CharacterDetailViewModel(characterId: characterId)
    return viewController
  }
}
