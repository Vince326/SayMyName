//
//  Death.swift
//  SayMyName
//
//  Created by Vincent Hunter on 6/3/25.
//

import Foundation

struct Death: Decodable {
    let character: String
    let image: URL
    let details: String
    let lastWords: String
}
