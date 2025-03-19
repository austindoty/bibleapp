//
//  BibleViewModel.swift
//  Bible
//
//  Created by admin on 3/19/25.
//
import SwiftUI

class BibleViewModel: ObservableObject {
    @Published var selectedBook: BibleBook
    @Published var selectedChapter: Int
    @Published var isBookListVisible = false
    @Published var isChapterListVisible = false
    
    let books: [BibleBook]
    
    init() {
        self.books = BibleData.books
        self.selectedBook = books[0]
        self.selectedChapter = 1
    }
    
    func toggleBookList() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            isBookListVisible.toggle()
            if isBookListVisible { isChapterListVisible = false }
        }
    }
    
    func toggleChapterList() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
            isChapterListVisible.toggle()
            if isChapterListVisible { isBookListVisible = false }
        }
    }
    
    func selectBook(_ book: BibleBook) {
        selectedBook = book
        selectedChapter = 1 // Reset to first chapter
        toggleBookList()
    }
    
    func selectChapter(_ chapter: Int) {
        selectedChapter = chapter
        toggleChapterList()
    }
}
