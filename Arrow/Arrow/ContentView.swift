//
//  ContentView.swift
//  Arrow
//
//  Created by Yazan Ghunaim on 8/17/23.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX / 2, y: rect.midY / 2))
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX * 1.5, y: rect.midY / 2))
        
        return path
    }
}

struct ContentView: View {
    @State private var thickness = 1.0
    
    var body: some View {
        VStack {
            Arrow()
                .stroke(.red, style: StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 300)
            
            Slider(value: $thickness, in: 1...10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
