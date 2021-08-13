//
//  ContentView.swift
//  BookPicker
//
//  Created by Tzortzis Kapellas on 13/8/21.
//

import SwiftUI

struct BookSelection: View {
    
    @EnvironmentObject var model: BookModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVStack(alignment: .leading, spacing: 30){
                    ForEach(model.books){book in
                        NavigationLink(
                            destination: BookRating(book: book))
                        {
                            BookPreview(book: book)
                                .padding([.leading, .trailing], 20)
                        }
                        NavigationLink(destination: EmptyView()) {
                            EmptyView()
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("My Library")
        }
    }
}

struct BookSelection_Previews: PreviewProvider {
    static var previews: some View {
        BookSelection()
            .environmentObject(BookModel())
    }
}
