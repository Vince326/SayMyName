//
//  StringExt.swift
//  SayMyName
//
//  Created by Vincent Hunter on 8/12/25.
//

extension String {
   func removeSpaces() -> String {
       self.replacingOccurrences(of: " ", with: "")
    }
    
    func removeCaseAndSpace() -> String {
        self.removeSpaces().lowercased()
    }
}
