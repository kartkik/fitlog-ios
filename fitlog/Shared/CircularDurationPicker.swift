//
//  CircularDurationPicker.swift
//  fitlog
//
//  Created by 12345 on 23/11/2025.
//

import SwiftUI

struct CircularDurationPicker: View {
    
    @Binding var minutes: Int
    let maxMinutes = 180
    
    var progress: CGFloat {
        CGFloat(minutes) / CGFloat(maxMinutes)
    }
    
    @State private var dragAngle: Angle = .degrees(0)
    
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            let radius = size / 2
            
            ZStack {
                
                Circle()
                    .stroke(AppThemes.secondaryClr.opacity(0.3), lineWidth: 22)
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        AppThemes.accentClr,
                        style: StrokeStyle(lineWidth: 22, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut(duration: 0.2), value: minutes)
                
                VStack(spacing: 4) {
                    Text("\(minutes)")
                        .font(AppThemes.bold(40))
                        .foregroundColor(AppThemes.textClr)
                    Text("min")
                        .font(AppThemes.regular(18))
                        .foregroundColor(AppThemes.textClr.opacity(0.7))
                }
                
                // Draggable knob
                Knob(progress: progress, radius: radius)
                    .fill(AppThemes.accentClr)
                    .frame(width: 28, height: 28)
                    .offset(x: radius * cos(CGFloat(progress * 2 * .pi) - .pi/2),
                            y: radius * sin(CGFloat(progress * 2 * .pi) - .pi/2))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                updateDrag(value: value, size: size)
                            }
                    )
            }
            .frame(width: size, height: size)
        }
    }
    
    private func updateDrag(value: DragGesture.Value, size: CGFloat) {
        let center = CGPoint(x: size/2, y: size/2)
        let dx = value.location.x - center.x
        let dy = value.location.y - center.y
        
        var angle = atan2(dy, dx) + .pi/2
        if angle < 0 { angle += 2 * .pi }
        
        let newMinutes = Int((angle / (2 * .pi)) * CGFloat(maxMinutes))
        
        minutes = max(1, min(newMinutes, maxMinutes))
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
}

struct Knob: Shape {
    var progress: CGFloat
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addEllipse(in: rect)
        return path
    }
}
