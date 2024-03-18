//
//  DragGesture.swift
//  SwiftUI-Animation
//
//  Created by JimmyChao on 2024/3/17.
//

import SwiftUI

struct DragGestureView: View {
    
    @State private var dragAmount = CGSize.zero
    @State private var listDragAmount = CGSize.zero
    @State private var toggle = true
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            HStack {
                ForEach(0..<12) { num in
                    Text("\(num)")
                        .frame(width: 15, height: 15)
                        .padding(5)
                        .background(toggle ? .red: .blue)
                        .offset(listDragAmount)
                        .animation(
                            .linear
                            .delay((Double(num) / 15.0) * 1.5),
                            value: listDragAmount)
                }
            }.gesture(
                DragGesture()
                    .onChanged { 
                        listDragAmount = $0.translation
                        
                    }
                    .onEnded { _ in
                        listDragAmount = .zero
                        toggle.toggle()
                    }
            )
            
            LinearGradient(
                colors: [.red, .blue, .green],
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipShape(.rect(cornerRadius: 20))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged{ dragAmount = $0.translation}
                    .onEnded{ _ in dragAmount = .zero }
            )
            .animation(.spring, value: dragAmount)
        }
        
    }
}

#Preview {
    DragGestureView()
}
