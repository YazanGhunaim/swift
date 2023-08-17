//
//  ContentView.swift
//  ColorCyclingRectangle
//
//  Created by Yazan Ghunaim on 8/17/23.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                        gradient: Gradient(colors: [
                            color(for: value, brightness: 1),
                            color(for: value, brightness: 0.5)
                        ]),
                        startPoint: UnitPoint(x: 0, y: Double(value) / Double(steps) + amount),
                        endPoint: UnitPoint(x: Double(value) / Double(steps) + amount, y: 0)
                    ), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
            var targetHue = Double(value) / Double(steps) + amount

            if targetHue > 1 {
                targetHue -= 1
            }

            return Color(hue: targetHue, saturation: 1, brightness: brightness)
        }
}

struct ContentView: View {
    @State private var colorCycle = 0.0
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorCycle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorCycle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
