//
//  ThemeManager.swift
//  ShopeX
//
//  Created by GitHub Copilot on 13/02/2026.
//

import SwiftUI

/// Manages the application's theme state and persistence
class ThemeManager: ObservableObject {
    @Published var colorScheme: ColorScheme?
    
    private let userDefaultsKey = "selectedTheme"
    
    init() {
        // Load saved theme preference
        if let savedTheme = UserDefaults.standard.string(forKey: userDefaultsKey) {
            switch savedTheme {
            case "light":
                colorScheme = .light
            case "dark":
                colorScheme = .dark
            default:
                colorScheme = nil // System default
            }
        }
    }
    
    /// Sets the theme and persists the preference
    func setTheme(_ scheme: ColorScheme?) {
        colorScheme = scheme
        
        // Save preference
        if let scheme = scheme {
            UserDefaults.standard.set(scheme == .light ? "light" : "dark", forKey: userDefaultsKey)
        } else {
            UserDefaults.standard.set("system", forKey: userDefaultsKey)
        }
    }
    
    /// Returns the current theme setting as a string
    var currentThemeName: String {
        if let scheme = colorScheme {
            return scheme == .light ? "light" : "dark"
        }
        return "system"
    }
}
