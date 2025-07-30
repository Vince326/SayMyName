//
//  FetchService.swift
//  SayMyName
//
//  Created by Vincent Hunter on 6/3/25.
//

import Foundation

struct FetchService {
   private enum FetchError: Error {
        case badResponse
    }
    
    private let baseUrl = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    //https://breaking-bad-api-six.vercel.app/api/quotes/random?production="Breaking+Bad"
    
    func fetchQuote(from show: String) async throws -> Quote {
        // Build the Fetch URL
        let quoteUrl = baseUrl.appending(path: "quotes/random")
        let fetchUrl = quoteUrl.appending(queryItems: [URLQueryItem(name: "production", value: show)])
        
        //Try to fetch data from url
        let (data,response) = try await URLSession.shared.data(from: fetchUrl)
        
        //Deal with the response from the server
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        //If the response was good, decode the data and put it in the model
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        //Return the quote
        return quote
    }
    
    func fetchCharacter(_ name: String) async throws -> Char {
        // Build the fetch URL
        let charURL = baseUrl.appending(path: "characters")
        let fetchURL = charURL.appending(queryItems: [URLQueryItem(name: "name", value: name)])
        
        // Fetch the Character from URL
        let (data,response) = try await URLSession.shared.data(from:fetchURL)
        
        //Deal with the response from server
        guard let response = response as? HTTPURLResponse, response.statusCode == 200  else{
            throw FetchError.badResponse
        }
        
        //If the character response is good, decode the data adn put it in the model
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let characters = try decoder.decode([Char].self, from: data)
        
        //Return the character
        return characters[0]
    }
    
    func fetchDeath(for character: String) async throws -> Death? {
        //Build URL
        let fetchURL = baseUrl.appending(path: "deaths")
        
        let (data,response) = try await URLSession.shared.data(from:fetchURL)
        
        //Deal with the response from server
        guard let response = response as? HTTPURLResponse, response.statusCode == 200  else{
            throw FetchError.badResponse
        }
        
        //If the character response is good, decode the data adn put it in the model
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let deaths = try decoder.decode([Death].self, from: data)
        
        for death in deaths {
            if death.character == character {
                return death
            }
        }
        
        return nil
    }
    
}
