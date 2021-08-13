//
//  BookModel.swift
//  BookPicker
//
//  Created by Tzortzis Kapellas on 13/8/21.
//

import Foundation

class BookModel : ObservableObject{
    
    @Published var books = [Book]()
    
    init(){
        self.books = BookService.getAllBooks()
    }
    
    func updateFavourite (forId :Int){
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }
    }
    
    func updateRating (forId :Int, rating:Int){
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
        }
    }
    
    func updatePage (forId :Int, page:Int){
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].currentPage = page
        }
    }
}
