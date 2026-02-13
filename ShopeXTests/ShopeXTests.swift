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
    
    @Test func testThemeManagerDefaultPreference() async throws {
        let themeManager = ThemeManager()
        #expect(themeManager.currentPreference == .system)
    }
    
    @Test func testThemeManagerSetLightTheme() async throws {
        let themeManager = ThemeManager()
        themeManager.setTheme(.light)
        #expect(themeManager.currentPreference == .light)
    }
    
    @Test func testThemeManagerSetDarkTheme() async throws {
        let themeManager = ThemeManager()
        themeManager.setTheme(.dark)
        #expect(themeManager.currentPreference == .dark)
    }
    
    @Test func testThemeManagerColorSchemeForSystem() async throws {
        let themeManager = ThemeManager()
        themeManager.setTheme(.system)
        #expect(themeManager.colorScheme(for: .light) == nil)
        #expect(themeManager.colorScheme(for: .dark) == nil)
    }
    
    @Test func testThemeManagerColorSchemeForLight() async throws {
        let themeManager = ThemeManager()
        themeManager.setTheme(.light)
        #expect(themeManager.colorScheme(for: .dark) == .light)
    }
    
    @Test func testThemeManagerColorSchemeForDark() async throws {
        let themeManager = ThemeManager()
        themeManager.setTheme(.dark)
        #expect(themeManager.colorScheme(for: .light) == .dark)
    }
    
    @Test func testThemePreferenceAllCases() async throws {
        let allCases = ThemePreference.allCases
        #expect(allCases.contains(.system))
        #expect(allCases.contains(.light))
        #expect(allCases.contains(.dark))
        #expect(allCases.count == 3)
    }
}
