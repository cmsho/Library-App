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
}
