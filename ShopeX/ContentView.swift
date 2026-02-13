//
//  ContentView.swift
//  ShopeX
//
//  Created by Volodymyr Snaichuk on 04/01/2026.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager
    @State private var showThemeSelector = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundPrimary")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Demo content
                    VStack(spacing: 12) {
                        Image(systemName: "moon.stars.fill")
                            .imageScale(.large)
                            .font(.system(size: 60))
                            .foregroundColor(Color("TextPrimary"))
                        
                        Text("ShopeX")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("TextPrimary"))
                        
                        Text("Welcome to ShopeX with Dark Mode!")
                            .font(.body)
                            .foregroundColor(Color("TextSecondary"))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    
                    // Card example
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Dark Mode Features")
                            .font(.headline)
                            .foregroundColor(Color("TextPrimary"))
                        
                        Text("• Adaptive color palette")
                            .foregroundColor(Color("TextSecondary"))
                        Text("• System theme support")
                            .foregroundColor(Color("TextSecondary"))
                        Text("• Manual theme toggle")
                            .foregroundColor(Color("TextSecondary"))
                        Text("• WCAG AA compliant")
                            .foregroundColor(Color("TextSecondary"))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(Color("CardBackground"))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("BorderColor"), lineWidth: 1)
                    )
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Theme toggle button
                    Button(action: {
                        showThemeSelector = true
                    }) {
                        HStack {
                            Image(systemName: themeIconName)
                            Text("Theme: \(themeManager.currentThemeName.capitalized)")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
            .navigationTitle("ShopeX")
            .navigationBarTitleDisplayMode(.inline)
            .confirmationDialog("Select Theme", isPresented: $showThemeSelector, titleVisibility: .visible) {
                Button("Light") {
                    themeManager.setTheme(.light)
                }
                Button("Dark") {
                    themeManager.setTheme(.dark)
                }
                Button("System") {
                    themeManager.setTheme(nil)
                }
                Button("Cancel", role: .cancel) {}
            }
        }
    }
    
    private var themeIconName: String {
        switch themeManager.currentThemeName {
        case "light":
            return "sun.max.fill"
        case "dark":
            return "moon.fill"
        default:
            return "circle.lefthalf.filled"
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ThemeManager())
}
