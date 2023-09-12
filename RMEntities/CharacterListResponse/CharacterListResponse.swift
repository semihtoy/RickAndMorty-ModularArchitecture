//
//  CharacterListResponse.swift
//  RMEntities
//
//  Created by SemihTOY on 6.09.2023.
//

import Foundation
public struct CharacterListResponse : Codable {
  public let info : Info?
  public let characters : [RMCharacter]?

  enum CodingKeys: String, CodingKey {
    case info
    case characters = "results"
  }

}
