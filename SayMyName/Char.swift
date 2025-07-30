//
//  Char.swift
//  SayMyName
//
//  Created by Vincent Hunter on 6/3/25.
//

import Foundation

struct Char: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let status: String
    let potrayedBy: String
    var death: Death?
    //let Quote: Quote
    
    enum CodingKeys: CodingKey {
        case name
        case birthday
        case occupations
        case images
        case aliases
        case status
        case potrayedBy
        
        
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.birthday = try container.decode(String.self, forKey: .birthday)
        self.occupations = try container.decode([String].self, forKey: .occupations)
        self.images = try container.decode([URL].self, forKey: .images)
        self.aliases = try container.decode([String].self, forKey: .aliases)
        self.status = try container.decode(String.self, forKey: .status)
        self.potrayedBy = try container.decode(String.self, forKey: .potrayedBy)
        
        let deathdecoder = JSONDecoder()
        deathdecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let deathData = try Data(contentsOf: Bundle.main.url(forResource: "sampledeath", withExtension: "json")!)
        death = try! deathdecoder.decode(Death.self, from: deathData)
        
        
        
    }
}
