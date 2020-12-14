//
//  City.swift
//  ISTE-454 Final Exam - Vicic Mateo
//
//  Created by MateoVicic on 12/4/20.
//

import Foundation

struct City: Identifiable, Decodable{
    public let id: Int
    public let city: String
    public let temperature: Double
    //public let meta: [Meta]
}

