//
//  ShopeXUITestsLaunchTests.swift
//  ShopeXUITests
//
//  Created by Volodymyr Snaichuk on 04/01/2026.
//

import XCTest

final class ShopeXUITestsLaunchTests: XCTestCase {

    // Note: Setting this to 'true' causes the test to run for each UI configuration
    // (e.g., light/dark mode, different text sizes). This is useful for screenshot
    // testing but increases test execution time. Consider setting to 'false' if
    // configuration-specific testing is not required.
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Take screenshot for verification
        // Using .deleteOnSuccess to save storage and improve performance
        // Change to .keepAlways if you need to preserve all screenshots
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .deleteOnSuccess
        add(attachment)
    }
}
