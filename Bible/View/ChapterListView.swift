//
//  ChapterListView.swift
//  Bible
//
//  Created by admin on 3/18/25.
//

import SwiftUI

struct ChapterListView: View {
    @ObservedObject var viewModel: BibleViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView {
                LazyVStack(alignment: .center, spacing: 0) {
                    ForEach(1...viewModel.selectedBook.chapters, id: \.self) { chapter in
                        Button(action: { viewModel.selectChapter(chapter) }) {
                            Text("\(chapter)")
                                .font(.body)
                                .foregroundColor(.primary)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 16) // Padding for each item
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .accessibilityLabel("Chapter \(chapter)")
                        .accessibilityHint("Selects chapter \(chapter)")
                    }
                }
            }
            .frame(maxHeight: .infinity) // Fill vertical space
        }
        .background(Color(.systemBackground))
        .frame(maxHeight: .infinity) // Full height from MainBibleReaderView
    }
}

struct ChapterListView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterListView(viewModel: BibleViewModel())
    }
}
