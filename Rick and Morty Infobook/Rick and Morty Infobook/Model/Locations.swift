//
//  Locations.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/12/20.
//

import Foundation

struct Locations: Identifiable, Codable{
    public let id: Int
    public let name: String
    public let type: String
    public let dimension: String
    public let residents: [String]
    public let url: URL
}
