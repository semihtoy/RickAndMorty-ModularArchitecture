//
//  CharacterView.swift
//  RMComponents
//
//  Created by SemihTOY on 11.09.2023.
//

import UIKit
import RMEntities

public class CharacterView: UIView {
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var characterImageView: UIImageView!
  @IBOutlet weak var characterNameLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var speciesLabel: UILabel!

  override public init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }

  func commonInit() {
    RMComponentsBundle.bundle.loadNibNamed("CharacterView", owner: self, options: nil)
    contentView.frame = self.bounds
    addSubview(contentView)
    contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
  }


  public func configureCharacterView(item: CharacterViewItem) {
    contentView.backgroundColor = .lightGray
    if let imageUrl = item.characterImage {
      characterImageView.load(url: URL(string: imageUrl)!)
    }
    characterNameLabel.text = item.characterName
    statusLabel.text = item.characterStatus
    speciesLabel.text = item.characterSpecies
  }
}
