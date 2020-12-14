//
//  WidgetCharacter.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/14/20.
//

import Foundation

struct WidgetCharacter: Codable {
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: URL?
    let episode: [String]
}

extension WidgetCharacter {
    static let preview = WidgetCharacter(
        name: "Rick Sanchez",
        status: "Alive",
        species: "Human",
        type: "",
        gender: "Male",
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
        episode: ["episode 1", "episode 2"]
    )
}
