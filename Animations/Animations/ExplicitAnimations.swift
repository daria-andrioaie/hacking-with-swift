//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by Daria Andrioaie on 01.08.2022.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct ExplicitAnimations: View {
//    @State private var animationAmount = 0.0
//    @State private var enabled = false
    //@State private var dragAmount = CGSize.zero

//    let letters = Array("Hello, SwiftUI")
//    @State private var enabled = false
//    @State private var dragAmount = CGSize.zero
    
    @State private var showingRed = false
    
    var body: some View {
        // rotations
        
//        Button("Tap me") {
//            withAnimation {
//                animationAmount += 360
//            }
//        }
//        .padding(50)
//        .background(.red)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 0))
        
        // modifier order matters
        
//        Button("Tap me") {
//            enabled.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enabled ? .blue : .red)
//        .animation(.default, value: enabled)
//        .foregroundColor(.white)
//        .clipShape(RoundedRectangle(cornerRadius: enabled ? 100 : 0))
//        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
        
        // animating gestures
        
//        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//                DragGesture()
//                    .onChanged { dragAmount = $0.translation }
//                    .onEnded { _ in
//                        withAnimation {
//                            dragAmount = .zero
//                        }
//                    }
//            )
//            //.animation(.spring(), value: dragAmount)
        
//        HStack(spacing: 0) {
//            ForEach(0..<letters.count) { num in
//                Text(String(letters[num]))
//                    .padding(5)
//                    .font(.title)
//                    .background(enabled ? .blue : .red)
//                    .offset(dragAmount)
//                    .animation(.default.delay(Double(num) / 20), value: dragAmount)
//            }
//        }
//        .gesture(
//            DragGesture()
//                .onChanged({
//                    dragAmount = $0.translation
//                })
//                .onEnded({ _ in
//                    dragAmount = .zero
//                    enabled.toggle()
//                })
//        )
        
        // showing and hiding views with transitions
//        VStack {
//            Button("Tap me") {
//                withAnimation {
//                    showingRed.toggle()
//                }
//            }
//
//            if showingRed {
//                Rectangle()
//                    .fill(.red)
//                    .frame(width: 200, height: 200)
////                    .transition(.scale)
//                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
//            }
//        }
        
        // Building custom transitions with ViewModifier
        
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if showingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                showingRed.toggle()
            }
        }
    }
}

struct ExplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ExplicitAnimations()
    }
}
