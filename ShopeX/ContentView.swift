//
//  ContentView.swift
//  ShopeX
//
//  Created by Volodymyr Snaichuk on 04/01/2026.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "moon.stars.fill")
                    .imageScale(.large)
                    .font(.system(size: 60))
                    .foregroundColor(Color("TextPrimary"))
                
                Text("ShopeX")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color("TextPrimary"))
                
                Text("Dark Mode Enabled")
                    .font(.subheadline)
                    .foregroundColor(Color("TextSecondary"))
                
                Divider()
                    .background(Color("BorderColor"))
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Theme Settings")
                        .font(.headline)
                        .foregroundColor(Color("TextPrimary"))
                    
                    ForEach(ThemeManager.Theme.allCases, id: \.self) { theme in
                        Button(action: {
                            themeManager.selectedTheme = theme
                        }) {
                            HStack {
                                Text(theme.displayName)
                                    .foregroundColor(Color("TextPrimary"))
                                Spacer()
                                if themeManager.selectedTheme == theme {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(Color.accentColor)
                                }
                            }
                            .padding()
                            .background(Color("CardBackground"))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .background(Color("BackgroundPrimary").ignoresSafeArea())
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ThemeManager())
}
