//
//  CharacterDetailResponse.swift
//  RMEntities
//
//  Created by SemihTOY on 13.09.2023.
//

import Foundation

public struct CharacterDetailResponse : Codable {
  public let id : Int?
  public let name : String?
  public let status : String?
  public let species : String?
  public let type : String?
  public let gender : String?
  public let origin : Origin?
  public let location : Location?
  public let image : String?
  public let episode : [String]?
  public let url : String?
  public let created : String?
}
