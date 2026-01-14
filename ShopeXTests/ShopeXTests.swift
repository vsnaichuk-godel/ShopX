//
//  ShopeXTests.swift
//  ShopeXTests
//
//  Created by Volodymyr Snaichuk on 04/01/2026.
//

import Testing
@testable import ShopeX

struct ShopeXTests {

    @Test func exampleContentViewCreation() async throws {
        // Test that ContentView can be instantiated
        // This ensures the view's initialization doesn't have runtime issues
        let contentView = ContentView()
        
        // Verify the view exists (basic smoke test)
        // In a real app, you would test computed properties, view models, etc.
        #expect(contentView.body != nil)
    }

}
