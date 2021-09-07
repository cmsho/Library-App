//
//  Book.swift
//  Library App
//
//  Created by Colton Shoenberger on 9/7/21.
//

import Foundation


class Book : Identifiable, Decodable {
    
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var id:Int
    var content:[String]
    
}
