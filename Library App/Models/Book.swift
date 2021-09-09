//
//  Book.swift
//  Library App

//  Created by Colton Shoenberger on 9/7/21.
//

import Foundation


class Book : Identifiable, Decodable {
    
    var title:String = "Title"
    var author:String = "Author"
    var isFavourite:Bool = false
    var currentPage:Int = 1
    var rating:Int = 3
    var id:Int = 1
    var content:[String] = ["This is a test book"]
    
}
