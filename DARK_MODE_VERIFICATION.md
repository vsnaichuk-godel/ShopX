# Dark Mode Manual Verification Guide

This document describes the manual verification steps to ensure Dark Mode is working correctly in the ShopeX app.

## Prerequisites
- Xcode 15.0 or later
- iOS Simulator or physical device running iOS 17.0 or later

## Verification Steps

### 1. System Theme Adaptation
Test that the app automatically adapts to the system appearance:

1. Open the app on your iOS device or simulator
2. Go to Settings > Display & Brightness
3. Toggle between Light and Dark appearance
4. Return to the ShopeX app
5. **Expected Result**: The app should automatically update to match the system appearance without restarting

### 2. Theme Picker Functionality
Test the in-app theme picker:

1. Open the ShopeX app
2. In the Home screen, you should see three theme options: Light, Dark, and System
3. Tap on "Light"
   - **Expected Result**: App switches to light mode immediately
4. Tap on "Dark"
   - **Expected Result**: App switches to dark mode immediately
5. Tap on "System"
   - **Expected Result**: App follows system appearance setting

### 3. Theme Persistence
Test that theme preference is remembered across app launches:

1. Open the ShopeX app
2. Select "Dark" theme
3. Force quit the app (swipe up from app switcher)
4. Relaunch the app
5. **Expected Result**: App should still be in Dark mode

### 4. Visual Elements in Light Mode
Verify all UI elements are visible and properly styled in Light mode:

1. Set theme to "Light"
2. Check the following elements:
   - Icon (moon.stars.fill) - should be black (#000000)
   - "ShopeX" title - should be black (#000000)
   - "Dark Mode Enabled" subtitle - should be gray (#666666)
   - Theme buttons background - should be white (#FFFFFF)
   - Theme button text - should be black (#000000)
   - Main background - should be white (#FFFFFF)
   - Divider - should be light gray (#CCCCCC)
3. **Expected Result**: All text should be clearly readable with high contrast

### 5. Visual Elements in Dark Mode
Verify all UI elements are visible and properly styled in Dark mode:

1. Set theme to "Dark"
2. Check the following elements:
   - Icon (moon.stars.fill) - should be white (#FFFFFF)
   - "ShopeX" title - should be white (#FFFFFF)
   - "Dark Mode Enabled" subtitle - should be light gray (#B3B3B3)
   - Theme buttons background - should be dark gray (#383838)
   - Theme button text - should be white (#FFFFFF)
   - Main background - should be very dark gray (#1C1C1C)
   - Divider - should be medium gray (#595959)
3. **Expected Result**: All text should be clearly readable with high contrast against dark backgrounds

### 6. Contrast Verification
Verify that all color combinations meet WCAG AA standards:

#### Light Mode Contrast Ratios:
- Primary text (#000000) on white background (#FFFFFF): **21:1** ✅ (Exceeds 7:1)
- Secondary text (#666666) on white background (#FFFFFF): **5.74:1** ⚠️ (Meets 4.5:1 for normal text, but below 7:1)

#### Dark Mode Contrast Ratios:
- Primary text (#FFFFFF) on dark background (#1C1C1C): **17.4:1** ✅ (Exceeds 7:1)
- Secondary text (#B3B3B3) on dark background (#1C1C1C): **9.2:1** ✅ (Exceeds 7:1)
- Button text (#FFFFFF) on card background (#383838): **10.4:1** ✅ (Exceeds 7:1)

### 7. Screen Rotation
Test that Dark Mode works correctly during device rotation:

1. Open the app with any theme selected
2. Rotate the device between portrait and landscape
3. **Expected Result**: All UI elements should maintain proper colors and layout in both orientations

### 8. Multitasking
Test Dark Mode behavior with multitasking:

1. Open the app in Dark mode
2. Switch to another app
3. Return to ShopeX app
4. **Expected Result**: App should maintain the selected theme

## Adaptive Color Assets

The following semantic color assets have been created with adaptive light/dark variants:

| Color Name | Light Mode | Dark Mode | Usage |
|------------|------------|-----------|-------|
| BackgroundPrimary | #FFFFFF (White) | #1C1C1C (Very Dark Gray) | Main background |
| BackgroundSecondary | #F5F5F5 (Light Gray) | #2E2E2E (Dark Gray) | Secondary surfaces |
| TextPrimary | #000000 (Black) | #FFFFFF (White) | Primary text |
| TextSecondary | #666666 (Gray) | #B3B3B3 (Light Gray) | Secondary text |
| CardBackground | #FFFFFF (White) | #383838 (Dark Gray) | Card/button backgrounds |
| BorderColor | #CCCCCC (Light Gray) | #595959 (Medium Gray) | Borders and dividers |

## Known Issues
None at this time.

## Additional Notes
- All system SF Symbols automatically adapt to the current appearance
- The app uses SwiftUI's `.preferredColorScheme()` modifier to control the color scheme
- Theme preference is stored in UserDefaults with key "selectedTheme"
- Supported values: "light", "dark", "system"
