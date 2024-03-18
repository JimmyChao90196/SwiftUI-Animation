//
//  ControlMultipleAnimation.swift
//  SwiftUI-Animation
//
//  Created by JimmyChao on 2024/3/17.
//

import SwiftUI

struct ControlMultipleAnimation: View {
    
    @State var animationToggle = true
    
    var body: some View {
        Button("Tap me") {
            animationToggle.toggle()
        }
        .padding(50)
        .foregroundStyle(.white)
        .background(animationToggle ? .red: .blue)
        .animation(.default, value: animationToggle)
        .clipShape(.rect(cornerRadius: animationToggle ? 0: 50))
        .animation(.spring(duration: 0.5, bounce: 0.8), value: animationToggle)
    }
}

#Preview {
    ControlMultipleAnimation()
}
