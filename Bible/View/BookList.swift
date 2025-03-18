//
//  BookList.swift
//  Bible
//
//  Created by admin on 3/18/25.
//

import Foundation
import SwiftUI

struct BookList: View {
    let books = ["Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy"] // Dummy Data..

    var body: some View {
        NavigationView {
            List(books, id: \.self) { book in
                NavigationLink(destination: ChapterSelect(book: book)) {
                    Text(book)
                }
            }
            .navigationTitle("Bible Books")
        }
    }
}
