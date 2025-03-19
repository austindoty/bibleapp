//
//  BibleData.swift
//  Bible
//
//  Created by admin on 3/18/25.
//

import Foundation

struct BibleBook: Identifiable {
    let id = UUID()
    let name: String
    let chapters: Int
}

struct BibleData {
    static let books: [BibleBook] = [
        BibleBook(name: "Genesis", chapters: 50),
        BibleBook(name: "Exodus", chapters: 40),
        BibleBook(name: "Leviticus", chapters: 27),
        BibleBook(name: "Numbers", chapters: 36),
        BibleBook(name: "Deuteronomy", chapters: 34),
        // Add more books...
    ]
    
    static func verses(for book: String, chapter: Int) -> [String]? {
        // Mock data; replace with real source
        // Return nil if data fails (e.g., invalid book/chapter)
        guard books.contains(where: { $0.name == book && chapter <= $0.chapters }) else {
            return nil
        }
        return (1...10).map { "Verse \($0) of \(book) Chapter \(chapter)" }
    }
}
