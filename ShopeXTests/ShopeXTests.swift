//
//  ShopeXTests.swift
//  ShopeXTests
//
//  Created by Volodymyr Snaichuk on 04/01/2026.
//

import Testing
import SwiftUI
@testable import ShopeX

struct ShopeXTests {

    @Test func testThemeManagerInitialization() async throws {
        let themeManager = ThemeManager()
        #expect(themeManager.selectedTheme == .system)
    }
    
    @Test func testThemeManagerSetLight() async throws {
        let themeManager = ThemeManager()
        themeManager.selectedTheme = .light
        #expect(themeManager.selectedTheme == .light)
        #expect(themeManager.selectedTheme.colorScheme == .light)
    }
    
    @Test func testThemeManagerSetDark() async throws {
        let themeManager = ThemeManager()
        themeManager.selectedTheme = .dark
        #expect(themeManager.selectedTheme == .dark)
        #expect(themeManager.selectedTheme.colorScheme == .dark)
    }
    
    @Test func testThemeManagerSetSystem() async throws {
        let themeManager = ThemeManager()
        themeManager.selectedTheme = .system
        #expect(themeManager.selectedTheme == .system)
        #expect(themeManager.selectedTheme.colorScheme == nil)
    }
    
    @Test func testThemeDisplayNames() async throws {
        #expect(ThemeManager.Theme.light.displayName == "Light")
        #expect(ThemeManager.Theme.dark.displayName == "Dark")
        #expect(ThemeManager.Theme.system.displayName == "System")
    }
    
    @Test func testThemeRawValues() async throws {
        #expect(ThemeManager.Theme.light.rawValue == "light")
        #expect(ThemeManager.Theme.dark.rawValue == "dark")
        #expect(ThemeManager.Theme.system.rawValue == "system")
    }
    
    @Test func testThemePersistence() async throws {
        let themeManager = ThemeManager()
        themeManager.selectedTheme = .dark
        
        // Verify the value is saved to UserDefaults
        let savedValue = UserDefaults.standard.string(forKey: "selectedTheme")
        #expect(savedValue == "dark")
        
        // Create a new instance and verify it loads the saved theme
        let newThemeManager = ThemeManager()
        #expect(newThemeManager.selectedTheme == .dark)
        
        // Clean up
        UserDefaults.standard.removeObject(forKey: "selectedTheme")
    }

}
