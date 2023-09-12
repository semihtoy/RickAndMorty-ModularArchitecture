//
//  CharacterViewItem.swift
//  RMEntities
//
//  Created by SemihTOY on 11.09.2023.
//

import UIKit

public struct CharacterViewItem {
  public let characterImage: String?
  public let characterName: String
  public let characterStatus: String
  public let characterSpecies: String

  public init(characterImage: String?, characterName: String, characterStatus: String, characterSpecies: String) {
    self.characterImage = characterImage
    self.characterName = characterName
    self.characterStatus = characterStatus
    self.characterSpecies = characterSpecies
  }
}
