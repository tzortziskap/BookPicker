//
//  BookServise.swift
//  BookPicker
//
//  Created by Tzortzis Kapellas on 13/8/21.
//

import Foundation

class BookService{
    
    static func getAllBooks() -> [Book]{
        
        let pathString = Bundle.main.path(forResource: "BooksData", ofType: "json")
        
        guard pathString != nil else {
            return [Book]()
        }
        
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do{
                let bookData = try decoder.decode([Book].self, from: data)
                return bookData
            }
            catch {
                print(error)
                return [Book]()
            }
        }
        catch {
            print(error)
            return [Book]()
        }
    }
}
