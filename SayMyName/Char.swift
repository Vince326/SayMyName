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
    let Quote: Quote
    
    
}
