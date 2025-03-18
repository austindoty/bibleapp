//
//  ChapterSelect.swift
//  Bible
//
//  Created by admin on 3/18/25.
//

import SwiftUI

struct ChapterSelect: View {
    let book: String
    let chapters = Array(1...50) // Dummy data: 50 chapters

    var body: some View {
        List(chapters, id: \.self) { chapter in
            NavigationLink(destination: VerseSelect(book: book, chapter: chapter)) {
                Text("Chapter \(chapter)")
            }
        }
        .navigationTitle(book)
    }
}
