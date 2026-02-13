//
//  ThemeManager.swift
//  ShopeX
//
//  Created by Dark Mode Implementation
//

import SwiftUI

class ThemeManager: ObservableObject {
    @Published var selectedTheme: Theme = .system {
        didSet {
            saveTheme()
        }
    }
    
    enum Theme: String, CaseIterable {
        case light = "light"
        case dark = "dark"
        case system = "system"
        
        var colorScheme: ColorScheme? {
            switch self {
            case .light:
                return .light
            case .dark:
                return .dark
            case .system:
                return nil
            }
        }
        
        var displayName: String {
            switch self {
            case .light:
                return "Light"
            case .dark:
                return "Dark"
            case .system:
                return "System"
            }
        }
    }
    
    init() {
        loadTheme()
    }
    
    private func loadTheme() {
        if let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme"),
           let theme = Theme(rawValue: savedTheme) {
            selectedTheme = theme
        }
    }
    
    private func saveTheme() {
        UserDefaults.standard.set(selectedTheme.rawValue, forKey: "selectedTheme")
    }
}
