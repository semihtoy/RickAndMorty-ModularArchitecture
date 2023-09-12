//
//  CharacterCell.swift
//  RMComponents
//
//  Created by SemihTOY on 12.09.2023.
//

import UIKit
import RMEntities

public class CharacterCell: UICollectionViewCell {

  @IBOutlet weak var characterView: CharacterView!

  public override class func awakeFromNib() {
    super.awakeFromNib()
  }

  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupUI() {
    let characterView = CharacterView()
    addSubview(characterView)
    characterView.frame = bounds
    self.characterView = characterView
  }

  public func configure(item: CharacterViewItem) {
    characterView.configureCharacterView(item: item)
  }

}
