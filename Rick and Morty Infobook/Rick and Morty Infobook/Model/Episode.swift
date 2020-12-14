//
//  Episode.swift
//  Rick and Morty Infobook
//
//  Created by MateoVicic on 12/12/20.
//

import Foundation

struct Episode: Identifiable, Codable{
    public let id: Int
    public let name: String
    public let air_date: String
    public let episode: String
    public let characters: [String]
    public let url: URL
}
