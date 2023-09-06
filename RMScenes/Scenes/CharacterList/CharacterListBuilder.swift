//
//  CharacterListBuilder.swift
//  RMScenes
//
//  Created by SemihTOY on 6.09.2023.
//

import RMNetwork
import UIKit

class CharacterListBuilder {

  private let characterListUseCase: CharacterListUseCase

  init(characterListUseCase: CharacterListUseCase) {
    self.characterListUseCase = characterListUseCase
  }

  func build() -> UIViewController {
    guard let viewController = UIStoryboard.instantiateViewController(.characterList, CharacterListViewController.self) else {
        fatalError("Cannot be instantiated")
    }
    viewController.viewModel = CharacterListViewModel(characterListUseCase: characterListUseCase)
    return viewController
  }
}
