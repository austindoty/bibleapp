//
//  ChapterContentView.swift
//  Bible
//
//  Created by admin on 3/18/25.
//

import SwiftUI

struct ChapterContentView: View {
    let book: String
    let chapter: Int
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10) {
                if let verses = BibleData.verses(for: book, chapter: chapter), !verses.isEmpty {
                    ForEach(verses, id: \.self) { verse in
                        Text(verse)
                            .font(.body)
                            .padding(.horizontal)
                    }
                } else {
                    Text("No verses available")
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

