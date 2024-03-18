//
//  TransitionView.swift
//  SwiftUI-Animation
//
//  Created by JimmyChao on 2024/3/18.
//

import SwiftUI

struct CustomModifier: ViewModifier {
    let amount: Double
    let anchorPoint: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchorPoint)
            .clipped()
            
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        AnyTransition.modifier(
            active: CustomModifier(amount: -90, anchorPoint: .topTrailing),
            identity: CustomModifier(amount: 0, anchorPoint: .topTrailing))
    }
}

struct TransitionView: View {
    
    @State var isShowing = true
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation(.easeInOut(duration: 0.35)) {
                    isShowing.toggle()
                }
            }
            
            if isShowing {
                Rectangle()
                    .fill(.red)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .transition(.asymmetric(insertion: .scale, removal: .pivot))
            }
        }
    }
}

#Preview {
    TransitionView()
}
