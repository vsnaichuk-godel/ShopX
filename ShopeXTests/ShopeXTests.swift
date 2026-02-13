//
//  ShopeXTests.swift
//  ShopeXTests
//
//  Created by Volodymyr Snaichuk on 04/01/2026.
//

import Testing
@testable import ShopeX

struct ShopeXTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test func themeManagerInitializesWithSystemDefault() {
        // Clear any saved preferences
        UserDefaults.standard.removeObject(forKey: "selectedTheme")
        
        let manager = ThemeManager()
        #expect(manager.colorScheme == nil)
        #expect(manager.currentThemeName == "system")
    }
    
    @Test func themeManagerSetsLightTheme() {
        let manager = ThemeManager()
        manager.setTheme(.light)
        
        #expect(manager.colorScheme == .light)
        #expect(manager.currentThemeName == "light")
        
        // Verify persistence
        let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme")
        #expect(savedTheme == "light")
    }
    
    @Test func themeManagerSetsDarkTheme() {
        let manager = ThemeManager()
        manager.setTheme(.dark)
        
        #expect(manager.colorScheme == .dark)
        #expect(manager.currentThemeName == "dark")
        
        // Verify persistence
        let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme")
        #expect(savedTheme == "dark")
    }
    
    @Test func themeManagerSetsSystemTheme() {
        let manager = ThemeManager()
        manager.setTheme(nil)
        
        #expect(manager.colorScheme == nil)
        #expect(manager.currentThemeName == "system")
        
        // Verify persistence
        let savedTheme = UserDefaults.standard.string(forKey: "selectedTheme")
        #expect(savedTheme == "system")
    }
    
    @Test func themeManagerLoadsPersistedTheme() {
        // Save a theme preference
        UserDefaults.standard.set("dark", forKey: "selectedTheme")
        
        let manager = ThemeManager()
        #expect(manager.colorScheme == .dark)
        #expect(manager.currentThemeName == "dark")
    }

}
