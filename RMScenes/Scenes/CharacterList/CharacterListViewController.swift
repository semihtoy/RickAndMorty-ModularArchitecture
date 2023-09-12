//
//  CharacterListViewController.swift
//  RMScenes
//
//  Created by SemihTOY on 6.09.2023.
//

import UIKit
import RMComponents
import RMEntities
import Combine

class CharacterListViewController: UIViewController {

  public var viewModel: CharacterListViewModel!
  private var cancellables: Set<AnyCancellable> = []
  private var characters: [RMCharacter]?
  @IBOutlet weak var characterListCollectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    observable()
  }

  func observable() {
    viewModel.$characterListResponse.sink { [weak self] characterListResponse in
      self?.characters = characterListResponse?.characters
      self?.registerCollectionView()
    }.store(in: &cancellables)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = true
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    self.navigationController?.navigationBar.isHidden = false
  }

}

extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource {

  func registerCollectionView() {
    characterListCollectionView.delegate = self
    characterListCollectionView.dataSource = self
    characterListCollectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "CharacterCell")
    let layout = GridFlowLayout()
    characterListCollectionView.collectionViewLayout = layout
    characterListCollectionView.reloadData()
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return characters?.count ?? 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as? CharacterCell else {
      return UICollectionViewCell()
    }
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    guard let characterCell = cell as? CharacterCell else { return }
    let character = characters?[indexPath.row]
    let item = CharacterViewItem(
      characterImage: character?.image,
      characterName: character?.name ?? "",
      characterStatus: character?.status ?? "",
      characterSpecies: character?.species ?? "")
      characterCell.configure(item: item)

  }
}
