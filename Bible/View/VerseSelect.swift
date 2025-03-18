//
//  VerseSelect.swift
//  Bible
//
//  Created by admin on 3/18/25.
//

import SwiftUI

struct VerseSelect: View {
    let book: String
    let chapter: Int
    let verses = Array(1...20) // Dummy data: 20 verses

    var body: some View {
        List(verses, id: \.self) { verse in
            Text("Verse \(verse): This is a placeholder verse.")
        }
        .navigationTitle("\(book) \(chapter)")
    }
}
