//
//  CharacterPage.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/12/20.
//

import Foundation

struct CharacterPage: Codable {
    public let info: Info
    public let results: [Character]
}
