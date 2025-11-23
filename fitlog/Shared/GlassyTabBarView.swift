//
//  GlassyTabBarView.swift
//  fitlog
//
//  Created by 12345 on 23/11/2025.
//

import SwiftUI

struct GlassyTabBarView: View {
    @State private var selected = 0
    
    var body: some View {
        ZStack {
            
            // Main Screens
            Group {
                switch selected {
                case 0: HomeView()
                case 1: HomeView()
                case 2: HomeView()
                default: HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
            // Glass Bottom Bar
            VStack {
                Spacer()
                glassyBar
            }
            .ignoresSafeArea()
        }
    }
    
    // MARK: - Glassy Tab Bar
    private var glassyBar: some View {
        HStack(spacing: 60) {
            tabItem(icon: "house.fill", index: 0)
            tabItem(icon: "figure.walk", index: 1)
            tabItem(icon: "person.crop.circle", index: 2)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 28)
        .background(.ultraThinMaterial)  // GLASS EFFECT
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.15), radius: 12, x: 0, y: 6)
        .padding(.bottom, 22)
    }
    
    // MARK: - Single Tab Button
    private func tabItem(icon: String, index: Int) -> some View {
        Button {
            selected = index
        } label: {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(selected == index ? AppThemes.accentClr : .gray)
                .scaleEffect(selected == index ? 1.2 : 1.0)
                .animation(.spring(response: 0.35, dampingFraction: 0.7), value: selected)
        }
    }
}
