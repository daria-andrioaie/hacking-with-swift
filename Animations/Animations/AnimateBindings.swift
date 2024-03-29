//
//  AnimateBindings.swift
//  Animations
//
//  Created by Daria Andrioaie on 01.08.2022.
//

import SwiftUI

struct AnimateBindings: View {
    @State private var animationAmount = 1.0
    var body: some View {
        print(animationAmount)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}

struct AnimateBindings_Previews: PreviewProvider {
    static var previews: some View {
        AnimateBindings()
    }
}
