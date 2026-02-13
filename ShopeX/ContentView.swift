//
//  ContentView.swift
//  ShopeX
//
//  Created by Volodymyr Snaichuk on 04/01/2026.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                Color("BackgroundPrimary")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Header Section
                        VStack(spacing: 8) {
                            Image(systemName: "moon.stars.fill")
                                .imageScale(.large)
                                .font(.system(size: 50))
                                .foregroundColor(.accentColor)
                                .padding(.top, 20)
                            
                            Text("ShopeX")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color("TextPrimary"))
                            
                            Text(colorScheme == .dark ? "Dark Mode" : "Light Mode")
                                .font(.subheadline)
                                .foregroundColor(Color("TextSecondary"))
                        }
                        .padding()
                        
                        // Theme Toggle Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Theme Settings")
                                .font(.headline)
                                .foregroundColor(Color("TextPrimary"))
                                .padding(.horizontal)
                            
                            VStack(spacing: 0) {
                                ForEach(ThemePreference.allCases, id: \.self) { preference in
                                    ThemeOptionRow(
                                        preference: preference,
                                        isSelected: themeManager.currentPreference == preference
                                    )
                                    .onTapGesture {
                                        themeManager.setTheme(preference)
                                    }
                                    
                                    if preference != ThemePreference.allCases.last {
                                        Divider()
                                            .padding(.leading, 60)
                                    }
                                }
                            }
                            .background(Color("CardBackground"))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        }
                        
                        // Demo Cards Section
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Demo Cards")
                                .font(.headline)
                                .foregroundColor(Color("TextPrimary"))
                                .padding(.horizontal)
                            
                            VStack(spacing: 12) {
                                DemoCard(
                                    icon: "cart.fill",
                                    title: "Shopping",
                                    description: "Browse products with adaptive colors"
                                )
                                
                                DemoCard(
                                    icon: "person.fill",
                                    title: "Profile",
                                    description: "Manage your account settings"
                                )
                                
                                DemoCard(
                                    icon: "star.fill",
                                    title: "Favorites",
                                    description: "View your saved items"
                                )
                            }
                            .padding(.horizontal)
                        }
                        
                        // Current Theme Info
                        VStack(spacing: 8) {
                            Text("Current Theme: \(colorScheme == .dark ? "Dark" : "Light")")
                                .font(.caption)
                                .foregroundColor(Color("TextSecondary"))
                            
                            Text("Preference: \(themeManager.currentPreference.rawValue)")
                                .font(.caption)
                                .foregroundColor(Color("TextSecondary"))
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 30)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

/// A row for theme selection
struct ThemeOptionRow: View {
    let preference: ThemePreference
    let isSelected: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: iconName)
                .font(.system(size: 24))
                .foregroundColor(.accentColor)
                .frame(width: 30)
            
            Text(preference.rawValue)
                .font(.body)
                .foregroundColor(Color("TextPrimary"))
            
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.accentColor)
            }
        }
        .padding()
        .contentShape(Rectangle())
    }
    
    private var iconName: String {
        switch preference {
        case .system:
            return "gear"
        case .light:
            return "sun.max.fill"
        case .dark:
            return "moon.fill"
        }
    }
}

/// A demo card component to showcase theme colors
struct DemoCard: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(.accentColor)
                .frame(width: 50, height: 50)
                .background(Color("BackgroundSecondary"))
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color("TextPrimary"))
                
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(Color("TextSecondary"))
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color("TextSecondary"))
        }
        .padding()
        .background(Color("CardBackground"))
        .cornerRadius(12)
    }
}

#Preview {
    ContentView()
        .environmentObject(ThemeManager())
}

