//
//  LocationPage.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/12/20.
//

import Foundation

struct LocationPage: Codable {
    public let info: Info
    public let results: [Locations]
}
