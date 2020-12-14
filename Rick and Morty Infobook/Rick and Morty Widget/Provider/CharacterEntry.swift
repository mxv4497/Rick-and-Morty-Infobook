//
//  CharacterEntry.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/14/20.
//

import WidgetKit

struct CharacterEntry: TimelineEntry {
    var date: Date
    var character: WidgetCharacter
}

extension CharacterEntry {
    static let preview = CharacterEntry(date: Date(), character: WidgetCharacter.preview)
}
