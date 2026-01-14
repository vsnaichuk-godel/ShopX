//
//  ProfileView.swift
//  ShopeX
//
//  Created by Volodymyr Snaichuk on 14/01/2026.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.primaryBlack
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // Top Bar
                topBar

                // Profile Image Section
                profileImageSection
                    .padding(.top, 32)

                // User Details
                userDetailsSection
                    .padding(.top, 34)

                Spacer()
            }
        }
    }

    // MARK: - Top Bar
    private var topBar: some View {
        ZStack {
            // Title
            Text("Profile")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.primaryWhite)
                .tracking(0.32)

            HStack {
                // Back Button
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.primaryWhite)
                        .frame(width: 24, height: 24)
                }

                Spacer()

                // Edit Button
                Button(action: {
                    // Edit action
                }) {
                    Text("Edit")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.secondaryGray)
                        .underline()
                }
            }
            .padding(.horizontal, 20)
        }
        .frame(height: 82)
        .background(
            VStack {
                Spacer()
                Divider()
                    .background(Color.textBlack800)
            }
        )
    }

    // MARK: - Profile Image Section
    private var profileImageSection: some View {
        ZStack(alignment: .bottomTrailing) {
            // Profile Image
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .foregroundColor(.gray)

            // Camera Button
            ZStack {
                Circle()
                    .fill(Color.primaryBlack)
                    .frame(width: 32, height: 32)

                Image(systemName: "camera.fill")
                    .font(.system(size: 14))
                    .foregroundColor(.primaryWhite)
            }
            .offset(x: 4, y: 4)
        }
    }

    // MARK: - User Details Section
    private var userDetailsSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Divider at top
            Divider()
                .background(Color.textBlack800)
                .padding(.bottom, 32)

            // First Name
            ProfileFieldView(
                label: "FIRST NAME",
                value: "Rafi Akram"
            )
            .padding(.bottom, 26)

            // Email
            ProfileFieldView(
                label: "EMAIL",
                value: "rafiakram@gmail.com"
            )
            .padding(.bottom, 26)

            // Mobile
            ProfileFieldView(
                label: "MOBILE",
                value: "+96 52333247"
            )
            .padding(.bottom, 26)

            // Location
            ProfileFieldView(
                label: "LOCATION",
                value: "California"
            )
        }
        .padding(.horizontal, 20)
    }
}

// MARK: - Profile Field View
struct ProfileFieldView: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(.textGray400)
                .textCase(.uppercase)

            Text(value)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.primaryWhite)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    ProfileView()
}
