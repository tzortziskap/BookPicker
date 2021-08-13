//
//  BookContent.swift
//  BookPicker
//
//  Created by Tzortzis Kapellas on 13/8/21.
//

import SwiftUI

struct BookContent: View {
    
    @State private var page = 0
    @EnvironmentObject var model: BookModel
    
    
    var book: Book
    
    var body: some View {
        
        TabView(selection: $page){
            ForEach(book.content.indices){ index in
                VStack(alignment: .center){
                    Text(book.content[index]).tag(index)
                    
                    Spacer()
                    
                    Text("\(page + 1)")
                }
            }
            .padding()
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onChange(of: page, perform: { value in
            model.updatePage(forId: book.id, page: page)
        })
        .onAppear {
            page = book.currentPage
        }
    }
}

struct BookContent_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookContent(book:model.books[0])
            .environmentObject(BookModel())
    }
}
