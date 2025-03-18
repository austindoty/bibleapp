//
//  MainView.swift
//  Bible
//
//  Created by admin on 3/18/25.
//
import SwiftUI

struct BibleView: View {
    @State private var selectedBook = "Genesis"
    @State private var selectedChapter = 1
    @State private var isBookListVisible = false
    @State private var isChapterSelectVisible = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                // Main Content (Bible View)
                VStack {
                    // Top Bar
                    HStack {
                        // Book Selection Button
                        Button(action: {
                            withAnimation(.spring()) {
                                isBookListVisible.toggle()
                            }
                        }) {
                            Label {
                                Text(selectedBook)
                                    .fontWeight(.heavy)
                            } icon: {
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .heavy))
                            }
                            .foregroundColor(.primary)
                        }

                        Spacer()

                        // Chapter Selection Button
                        Button(action: {
                            withAnimation(.spring()) {
                                isChapterSelectVisible.toggle()
                            }
                        }) {
                                Text("\(selectedChapter)")
                                    .fontWeight(.heavy)
                            }
                            .foregroundColor(.primary)
                        
                    }
                    .padding()

                    // Bible Text (Dummy Data)
                    ScrollView {
                        Text("This is the text for \(selectedBook) Chapter \(selectedChapter).")
                            .font(.body)
                            .padding()
                            .foregroundColor(.primary)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .offset(x: isBookListVisible ? 150 : 0) // Shift main content when book menu is open
                .offset(x: isChapterSelectVisible ? -75 : 0) // Shift main content when chapter menu is open
                .animation(.spring(), value: isBookListVisible)
                .animation(.spring(), value: isChapterSelectVisible)

                // Dimmed Overlay
                if isBookListVisible || isChapterSelectVisible {
                    Color.primary
                        .opacity(0.0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.spring()) {
                                isBookListVisible = false
                                isChapterSelectVisible = false
                            }
                        }
                }
                if isBookListVisible {
                    BookList(selectedBook: $selectedBook, isMenuVisible: $isBookListVisible)
                        .frame(maxWidth: .infinity, alignment: .leading) // Align to left
                        .transition(.move(edge: .leading)) // Slide in from left
                }

                                // Chapter Menu (Slides from the right)
                if isChapterSelectVisible {
                    ChapterSelect(selectedChapter: $selectedChapter, isMenuVisible: $isChapterSelectVisible)
                        .frame(maxWidth: .infinity, alignment: .trailing) // Align to right
                        .transition(.move(edge: .trailing)) // Slide in from right
                }
            }
            .foregroundColor(.white)
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < -50 && isBookListVisible {
                            withAnimation(.spring()) {
                                isBookListVisible = false
                            }
                        } else if value.translation.width > 50 && isChapterSelectVisible {
                            withAnimation(.spring()) {
                                isChapterSelectVisible = false
                            }
                        }
                    }
            )
        }
    }
}
