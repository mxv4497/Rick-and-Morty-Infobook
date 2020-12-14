//
//  Character.swift
//  ISTE-454FinalExam-Vicic Mateo
//
//  Created by MateoVicic on 12/10/20.
//

import Foundation

struct Character: Identifiable, Codable {    
    public let id: Int
    public let name: String
    public let status: String
    public let species: String
    public let type: String
    public let gender: String
    public let origin: Origin
    public let location: Location
    public let image: URL
    public let episode: [String]
    public let url: URL
}
