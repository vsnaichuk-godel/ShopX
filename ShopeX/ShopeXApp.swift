//
//  ShopeXApp.swift
//  ShopeX
//
//  Created by Volodymyr Snaichuk on 04/01/2026.
//

import SwiftUI

@main
struct ShopeXApp: App {
    @StateObject private var themeManager = ThemeManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(themeManager)
                .preferredColorScheme(themeManager.selectedTheme.colorScheme)
        }
    }
}
