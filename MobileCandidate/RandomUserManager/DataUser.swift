//
//  DataUser.swift
//  MobileCandidate
//
//  Created by Cristian Piña on 29/08/22.
//

import Foundation

class Results: Codable{
    var results: [User]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

class User: Codable{
    let gender: String?
    let name: Name?
    let location: Location?
    let email: String?
    let cell: String?
    let picture: Picture?
    
    enum CodingKeys: String, CodingKey {
        case gender
        case name
        case location
        case email
        case cell
        case picture
    }
    
    
}

class Name: Codable {
    let title, first, last: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case first
        case last
    }
}

class Location: Codable {
    var street: Street?
    var city, state, country: String?
    
    enum CodingKeys: String, CodingKey {
        case street
        case city
        case state
        case country
    }
}

class Street: Codable {
    var number: Int?
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case number
        case name
    }
}

class Picture: Codable {
    var large, thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case large
        case thumbnail
    }
}
    

