//
//  ThemeManager.swift
//  ShopeX
//
//  Created by Copilot on 13/02/2026.
//

import SwiftUI

/// Theme preference options
enum ThemePreference: String, CaseIterable {
    case system = "System"
    case light = "Light"
    case dark = "Dark"
}

/// Manages the app's theme and persists user preferences
class ThemeManager: ObservableObject {
    @AppStorage("themePreference") var themePreference: String = ThemePreference.system.rawValue
    
    /// Returns the current color scheme based on user preference
    func colorScheme(for systemScheme: ColorScheme) -> ColorScheme? {
        let preference = ThemePreference(rawValue: themePreference) ?? .system
        
        switch preference {
        case .system:
            return nil // Use system preference
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
    
    /// Returns the current theme preference as an enum
    var currentPreference: ThemePreference {
        ThemePreference(rawValue: themePreference) ?? .system
    }
    
    /// Sets the theme preference
    func setTheme(_ preference: ThemePreference) {
        themePreference = preference.rawValue
    }
}
