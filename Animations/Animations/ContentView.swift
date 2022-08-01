//
//  ContentView.swift
//  Animations
//
//  Created by Daria Andrioaie on 01.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    var body: some View {
        // implicit animations always have to watch a particular value
        Button("Tap me") {
//            animationAmount += 1
        }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2-animationAmount)
                    .animation(.easeInOut(duration: 1)
                        .repeatForever( autoreverses: false),
                               value: animationAmount)
            )
            .onAppear {
                animationAmount = 2
            }
//            .scaleEffect(animationAmount)
//            .animation(.easeInOut(duration: 1)
//                .repeatForever( autoreverses: true),
//                       value: animationAmount)
//            .animation(.easeInOut(duration: 1)
//                .repeatCount(3, autoreverses: true),
//                       value: animationAmount)
//            .animation(
//                .easeInOut(duration: 2)
//                    .delay(1),
//                       value: animationAmount)
//            .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
            //.blur(radius: (animationAmount - 1) * 3)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
