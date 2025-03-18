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
       @Binding var selectedBook: String
       @Binding var isMenuVisible: Bool

    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text("Select Book")
                    .font(.headline)
                    .padding(.top, 10)
                
                ForEach(books, id: \.self) { book in
                    Button(action: {
                        withAnimation(.spring()) {
                            selectedBook = book
                            isMenuVisible = false
                        }
                    }) {
                        Text(book)
                            .foregroundColor(.primary)
                            .font(.system(size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.vertical, 5)
                }
                
                Spacer()
            }
            .padding()
            .frame(width: 150)
            .background(.primary)
        }
    }
