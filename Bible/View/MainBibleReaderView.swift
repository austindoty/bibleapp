//
//  MainBibleReaderView.swift
//  Bible
//
//  Created by admin on 3/18/25.
//

import SwiftUI

struct MainBibleReaderView: View {
    @StateObject private var viewModel = BibleViewModel()
    private let chapterListWidth: CGFloat = 100 // Fixed width for chapter menu
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .topLeading) {
                    // Book List (Slides from left, 60% width, full height)
                    BookListView(viewModel: viewModel)
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.height)
                        .offset(x: viewModel.isBookListVisible ? 0 : -geometry.size.width * 0.6)
                    
                    // Main Content (Slides with menus)
                    VStack(spacing: 0) {
                        TopBarView(viewModel: viewModel)
                        ChapterContentView(book: viewModel.selectedBook.name, chapter: viewModel.selectedChapter)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: viewModel.isBookListVisible ? geometry.size.width * 0.6 : (viewModel.isChapterListVisible ? -chapterListWidth : 0))
                    
                    // Chapter List (Slides from right, fixed narrow width, full height)
                    ChapterListView(viewModel: viewModel)
                        .frame(width: chapterListWidth, height: geometry.size.height)
                        .offset(x: viewModel.isChapterListVisible ? (geometry.size.width - chapterListWidth) : geometry.size.width)
                }
                .gesture(dragGesture(in: geometry))
                .animation(.spring(response: 0.6, dampingFraction: 0.9), value: viewModel.isBookListVisible || viewModel.isChapterListVisible)
            }
        }
    }
    
    private func dragGesture(in geometry: GeometryProxy) -> some Gesture {
        DragGesture(minimumDistance: 20)
            .onEnded { value in
                let swipeDistance = value.translation.width
                let threshold: CGFloat = 50
                if swipeDistance > threshold && !viewModel.isBookListVisible && !viewModel.isChapterListVisible {
                    viewModel.toggleBookList()
                } else if swipeDistance < -threshold && !viewModel.isBookListVisible && !viewModel.isChapterListVisible {
                    viewModel.toggleChapterList()
                } else if swipeDistance < -threshold && viewModel.isBookListVisible {
                    viewModel.toggleBookList()
                } else if swipeDistance > threshold && viewModel.isChapterListVisible {
                    viewModel.toggleChapterList()
                }
            }
    }
}

struct MainBibleReaderView_Previews: PreviewProvider {
    static var previews: some View {
        MainBibleReaderView()
    }
}
