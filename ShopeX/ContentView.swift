//
//  ContentView.swift
//  ShopeX
//
//  Created by Volodymyr Snaichuk on 04/01/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .accessibilityIdentifier("globe")
            Text("Hello, world!")
                .accessibilityIdentifier("helloText")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
