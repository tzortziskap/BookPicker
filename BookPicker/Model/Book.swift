//
//  Book.swift
//  BookPicker
//
//  Created by Tzortzis Kapellas on 13/8/21.
//

import Foundation

struct Book: Identifiable, Decodable {
    
    var id : Int
    var title : String
    var author : String
    var isFavourite : Bool
    var currentPage : Int
    var rating : Int
    var content : [String]
}
