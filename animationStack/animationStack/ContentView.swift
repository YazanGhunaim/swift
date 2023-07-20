//
//  ContentView.swift
//  animationStack
//
//  Created by Yazan Ghunaim on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    
    var body: some View {
        Button {
            withAnimation {
                enabled.toggle()
            }
        } label: {
            Image(systemName: "envelope")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .frame(width: 200, height: 200)
        .rotation3DEffect(Angle(degrees: enabled ? 360.0 : 0), axis: (x: 0, y: 1, z: 0))
        .animation(.linear(duration: 1.0).repeatForever(autoreverses: true), value: enabled)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
