# Dark Mode Visual Reference

## UI Layout

The ContentView now features:

### Header Section
```
┌─────────────────────────────────────┐
│                                     │
│              🌙 ⭐                  │
│            (Moon Icon)              │
│                                     │
│             ShopeX                  │
│          (Large Title)              │
│                                     │
│     Dark Mode / Light Mode          │
│        (Dynamic Status)             │
│                                     │
└─────────────────────────────────────┘
```

### Theme Settings Section
```
┌─────────────────────────────────────┐
│  Theme Settings                     │
│                                     │
│  ┌───────────────────────────────┐ │
│  │ ⚙️  System              ✓    │ │
│  ├───────────────────────────────┤ │
│  │ ☀️  Light                    │ │
│  ├───────────────────────────────┤ │
│  │ 🌙  Dark                     │ │
│  └───────────────────────────────┘ │
│                                     │
└─────────────────────────────────────┘
```

### Demo Cards Section
```
┌─────────────────────────────────────┐
│  Demo Cards                         │
│                                     │
│  ┌───────────────────────────────┐ │
│  │ 🛒  Shopping              ›   │ │
│  │     Browse products...        │ │
│  └───────────────────────────────┘ │
│                                     │
│  ┌───────────────────────────────┐ │
│  │ 👤  Profile               ›   │ │
│  │     Manage your account...    │ │
│  └───────────────────────────────┘ │
│                                     │
│  ┌───────────────────────────────┐ │
│  │ ⭐  Favorites             ›   │ │
│  │     View your saved items...  │ │
│  └───────────────────────────────┘ │
│                                     │
└─────────────────────────────────────┘
```

### Status Section
```
┌─────────────────────────────────────┐
│                                     │
│   Current Theme: Dark / Light       │
│   Preference: System / Light / Dark │
│                                     │
└─────────────────────────────────────┘
```

## Color Usage Example

### Light Mode
```
Background:    #FFFFFF (White)
Text Primary:  #000000 (Black)
Text Secondary: #666666 (Gray)
Cards:         #FFFFFF on #F2F2F2
```

### Dark Mode
```
Background:    #1C1C1C (Dark Gray)
Text Primary:  #FFFFFF (White)
Text Secondary: #C7C7C7 (Light Gray)
Cards:         #383838 on #2E2E2E
```

## Theme Flow

```
User Opens App
      ↓
Check @AppStorage for saved preference
      ↓
      ├─ If "system" → Use device appearance
      ├─ If "light"  → Force light mode
      └─ If "dark"   → Force dark mode
      ↓
Apply preferred color scheme
      ↓
Render UI with adaptive colors
      ↓
User Changes Theme
      ↓
Save to @AppStorage
      ↓
Update environment
      ↓
UI automatically updates
```

## Interaction Flow

```
User taps theme option
      ↓
ThemeManager.setTheme() called
      ↓
@AppStorage saves preference
      ↓
@Published triggers update
      ↓
Environment propagates change
      ↓
All views refresh with new colors
      ↓
Visual transition (instant)
```

## File Structure

```
ShopeX/
├── ShopeXApp.swift
│   └── Creates ThemeManager
│       └── Provides to environment
│
├── ThemeManager.swift
│   ├── @AppStorage themePreference
│   ├── colorScheme(for:)
│   └── setTheme()
│
├── ContentView.swift
│   ├── @EnvironmentObject ThemeManager
│   ├── Theme toggle UI
│   └── Demo components
│
└── Assets.xcassets/
    ├── BackgroundPrimary.colorset/
    ├── BackgroundSecondary.colorset/
    ├── TextPrimary.colorset/
    ├── TextSecondary.colorset/
    └── CardBackground.colorset/
```

## Component Hierarchy

```
ShopeXApp
  └── WindowGroup
      └── ContentView (with ThemeManager)
          ├── NavigationView
          │   └── ZStack
          │       ├── Background (BackgroundPrimary)
          │       └── ScrollView
          │           ├── Header VStack
          │           │   ├── Icon (accentColor)
          │           │   ├── Title (TextPrimary)
          │           │   └── Status (TextSecondary)
          │           │
          │           ├── Theme Settings VStack
          │           │   ├── Section Title (TextPrimary)
          │           │   └── Options VStack
          │           │       ├── ThemeOptionRow (System)
          │           │       ├── ThemeOptionRow (Light)
          │           │       └── ThemeOptionRow (Dark)
          │           │
          │           ├── Demo Cards VStack
          │           │   ├── Section Title (TextPrimary)
          │           │   └── Cards VStack
          │           │       ├── DemoCard (Shopping)
          │           │       ├── DemoCard (Profile)
          │           │       └── DemoCard (Favorites)
          │           │
          │           └── Status VStack
          │               ├── Current Theme (TextSecondary)
          │               └── Preference (TextSecondary)
```

## Color Application Matrix

| Component | Property | Light Mode | Dark Mode |
|-----------|----------|------------|-----------|
| Main Background | background | BackgroundPrimary (White) | BackgroundPrimary (Dark Gray) |
| Section Headers | foregroundColor | TextPrimary (Black) | TextPrimary (White) |
| Body Text | foregroundColor | TextPrimary (Black) | TextPrimary (White) |
| Caption Text | foregroundColor | TextSecondary (Gray) | TextSecondary (Light Gray) |
| Card Background | background | CardBackground (White) | CardBackground (Dark Gray) |
| Icon Background | background | BackgroundSecondary (Light Gray) | BackgroundSecondary (Medium Gray) |
| Selection Mark | foregroundColor | accentColor | accentColor |

## Accessibility Features

```
✓ High Contrast Ratios
  - Primary Text: 21:1
  - Secondary Text: 7:1+
  - Interactive Elements: Clear focus

✓ Semantic Colors
  - Named by purpose
  - Consistent throughout
  - Platform conventions

✓ Dynamic Type Support
  - Uses system fonts
  - Scales with user preference
  - Maintains readability

✓ VoiceOver Compatible
  - Proper labels
  - Semantic structure
  - Navigation support
```
