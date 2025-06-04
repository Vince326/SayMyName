//
//  FetchService.swift
//  SayMyName
//
//  Created by Vincent Hunter on 6/3/25.
//

import Foundation

struct FetchService {
    enum FetchError: Error {
        case badResponse
    }
    
    let baseUrl = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
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
}
