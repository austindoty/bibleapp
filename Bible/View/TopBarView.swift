//
//  TopBarView.swift
//  Bible
//
//  Created by admin on 3/19/25.
//

import SwiftUI

struct TopBarView: View {
    @ObservedObject var viewModel: BibleViewModel
    
    var body: some View {
        HStack {
            Button(action: viewModel.toggleBookList) {
                Label(viewModel.selectedBook.name, systemImage: "chevron.right")
                    .font(.headline.weight(.bold))
            }
            .accessibilityLabel("Select Book")
            .accessibilityHint("Opens the book selection menu")
            
            Spacer()
            
            Button(action: viewModel.toggleChapterList) {
                Text("\(viewModel.selectedChapter)")
                    .font(.headline.weight(.bold))
            }
            .accessibilityLabel("Select Chapter")
            .accessibilityHint("Opens the chapter selection menu")
        }
        .padding()
        .background(Color(.systemBackground))
    }
}
