//
//  BookList.swift
//  Bible
//
//  Created by admin on 3/18/25.
//
import SwiftUI

struct BookListView: View {
    @ObservedObject var viewModel: BibleViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Select Book")
                .font(.title2.weight(.bold))
                .padding(.top, 16)
                .padding(.horizontal)
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.books) { book in
                        Button(action: { viewModel.selectBook(book) }) {
                            Text(book.name)
                                .font(.body)
                                .foregroundColor(.primary)
                                .padding(.vertical, 10)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .accessibilityLabel("Book: \(book.name)")
                        .accessibilityHint("Selects \(book.name)")
                    }
                }
            }
            .frame(maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}
