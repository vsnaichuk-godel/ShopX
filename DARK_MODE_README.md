# ShopeX - Dark Mode Feature

## Quick Start

This implementation adds comprehensive Dark Mode support to ShopeX with:
- ✅ System, Light, and Dark theme options
- ✅ Persistent user preferences
- ✅ WCAG AA accessibility compliance
- ✅ Smooth theme transitions
- ✅ Comprehensive unit tests

## Usage

### In SwiftUI Views
```swift
@EnvironmentObject var themeManager: ThemeManager

// Use adaptive colors
Text("Hello")
    .foregroundColor(Color("TextPrimary"))
    .background(Color("BackgroundPrimary"))
```

### Change Theme
```swift
themeManager.setTheme(.dark)    // Dark mode
themeManager.setTheme(.light)   // Light mode
themeManager.setTheme(.system)  // Follow system
```

## Available Colors
- `BackgroundPrimary` - Main background
- `BackgroundSecondary` - Secondary backgrounds
- `TextPrimary` - Primary text
- `TextSecondary` - Secondary text
- `CardBackground` - Elevated surfaces

## Documentation
See [DARK_MODE_IMPLEMENTATION.md](DARK_MODE_IMPLEMENTATION.md) for complete details.
See [IMPLEMENTATION_SUMMARY.md](IMPLEMENTATION_SUMMARY.md) for architecture overview.
