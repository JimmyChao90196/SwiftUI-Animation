//
//  ContentView.swift
//  SwiftUI-Animation
//
//  Created by JimmyChao on 2024/3/17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scaleAmount = 1.0
    @State private var buttonScaleAmount = 1.0
    
    var body: some View {
        VStack {
            
            Stepper(
                "Scale amount",
                value: $buttonScaleAmount.animation(),
                step: 0.2)
                .padding()
            
            Button("Tap me") {
                buttonScaleAmount += 0.2
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .font(.largeTitle.bold())
            .clipShape(Circle())
            .scaleEffect(buttonScaleAmount)
            .overlay {
                Circle()
                    .stroke(.red)
                    .scaleEffect(scaleAmount)
                    .opacity(2 - scaleAmount)
                    .animation(
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: scaleAmount)
            }
        }
        .onAppear {
            scaleAmount = 2
        }
    }
}

#Preview {
    ContentView()
}
