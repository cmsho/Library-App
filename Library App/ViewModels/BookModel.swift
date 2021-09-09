//
//  BookModel.swift
//  Library App
//
//  Created by Colton Shoenberger on 9/7/21.
//

import Foundation

class BookModel : ObservableObject {
    
    @Published var books:[Book]
    
    init() {
        
        self.books = DataService.getLocalData()
        
    }
    
    /// Update the specified book's favourite status. Does nothing if `forId` is invalid.
    func updateFavourite(forId: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }
    }

    /// Update the specified book's rating. Does nothing if `forId` is invalid.
    func updateRating(forId: Int, rating: Int) {
        
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
        }
    }
    
}
