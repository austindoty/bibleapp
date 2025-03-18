//
//  ChapterSelect.swift
//  Bible
//
//  Created by admin on 3/18/25.
//

import SwiftUI

struct ChapterSelect: View {
    let chapters = Array(1...50) // Dummy data: 50 chapters
    @Binding var selectedChapter: Int
    @Binding var isMenuVisible: Bool

    var body: some View {
        ScrollView {
                VStack() {
                    Text("Select Chapter")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    ForEach(chapters, id: \.self) { chapter in
                        Button(action: {
                            withAnimation(.spring()) {
                                selectedChapter = chapter
                                isMenuVisible = false
                            }
                        }) {
                            Text("\(chapter)")
                                .foregroundColor(.primary)
                                .font(.system(size: 18))
                        }
                        .padding(.vertical, 5)
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(width: 75)
                .background(.primary)
            }
        }
    }
