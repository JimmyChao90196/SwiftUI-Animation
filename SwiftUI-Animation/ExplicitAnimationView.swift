//
//  ExplicitAnimationView.swift
//  SwiftUI-Animation
//
//  Created by JimmyChao on 2024/3/17.
//

import SwiftUI

struct ExplicitAnimationView: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        
        Button("Tap me") {
            
            withAnimation(.spring(duration: 0.5, bounce: 0.9)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .font(.headline.bold())
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .rotation3DEffect(
            .degrees(animationAmount),
            axis: (x: 0.0, y: 1.0, z: 0.0)
        )
    }
}

#Preview {
    ExplicitAnimationView()
}
