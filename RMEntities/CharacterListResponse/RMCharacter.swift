//
//  RMCharacter.swift
//  RMEntities
//
//  Created by SemihTOY on 6.09.2023.
//

import Foundation

public struct RMCharacter : Codable {
  let id : Int?
  let name : String?
  let status : String?
  let species : String?
  let type : String?
  let gender : String?
  let origin : Origin?
  let location : Location?
  let image : String?
  let episode : [String]?
  let url : String?
  let created : String?
}
