//
//  ContentView.swift
//  Bible
//
//  Created by admin on 3/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "book")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Bible App Initial Commit")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
