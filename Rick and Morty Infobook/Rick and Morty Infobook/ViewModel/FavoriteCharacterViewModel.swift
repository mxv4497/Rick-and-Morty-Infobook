//
//  FavoriteCharacter.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/13/20.
//

import Foundation
import Combine
import SwiftUI

class FavoriteCharacterViewModel: ObservableObject {
    @Published var favCharacters: [Character] = []
    
    func toggleBookmark(character: Character) {
        print(character.name)
        if let index = favCharacters.firstIndex(where: { $0.id == character.id }) {
            favCharacters.remove(at: index)
            print(" removed")
        } else {
            favCharacters.append(character)
            print(" added")
        }
    }

    func isBookmarked(character: Character) -> Bool {
        return favCharacters.contains(where: { $0.id == character.id })
    }

}
