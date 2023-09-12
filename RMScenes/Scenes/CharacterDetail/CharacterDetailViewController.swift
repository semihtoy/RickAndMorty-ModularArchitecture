//
//  CharacterDetailViewController.swift
//  RMScenes
//
//  Created by SemihTOY on 13.09.2023.
//

import UIKit
import RMComponents
import RMEntities
import Combine

class CharacterDetailViewController: UIViewController {

  public var viewModel: CharacterDetailViewModel!
  private var cancellables: Set<AnyCancellable> = []

  @IBOutlet weak var characterView: CharacterView!

  override func viewDidLoad() {
    super.viewDidLoad()
    observable()
  }

  func observable() {
    viewModel.$characterDetailResponse.sink { [weak self] characterDetailResponse in
      let item = CharacterViewItem(characterImage: characterDetailResponse?.image,
                               characterName: characterDetailResponse?.name ?? "",
                               characterStatus: characterDetailResponse?.status ?? "",
                               characterSpecies: characterDetailResponse?.species ?? "")
      self?.setupCharacterDetailView(item: item)
    }.store(in: &cancellables)
  }

  private func setupCharacterDetailView(item: CharacterViewItem) {
    characterView.configureCharacterView(item: item)
  }

}

