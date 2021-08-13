//
//  BookPreview.swift
//  BookPicker
//
//  Created by Tzortzis Kapellas on 13/8/21.
//

import SwiftUI

struct BookPreview: View {
    
    var book: Book
    
    var body: some View {
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: -5, y: 5)
            
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text(book.title)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    if book.isFavourite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.yellow)
                    }
                }
                Text(book.author)
                    .italic()
                
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
            }
            .padding()
        }
        .accentColor(.black)
    }
}

struct BookPreview_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookPreview(book: model.books[0])
    }
}
