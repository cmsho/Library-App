//
//  DataService.swift
//  Library App
//
//  Created by Colton Shoenberger on 9/7/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Book] {
        
        // Parse local json file
        
        // Get a URL path to the json file
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        
        guard pathString != nil else {
            return [Book]()
        }
        
        // Create a URL object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            // Create a data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let bookData = try decoder.decode([Book].self, from: data)
   
                // Return the recipes
                return bookData
                
            }
            catch {
                //error with parsing json
                print(error)
            }
            
        }
        catch {
            // error with getting data
            print(error)
        }
        
        return [Book]()
    }
}
