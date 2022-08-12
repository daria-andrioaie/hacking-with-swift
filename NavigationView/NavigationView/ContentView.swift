//
//  ContentView.swift
//  NavigationView
//
//  Created by Daria Andrioaie on 12.08.2022.
//

import SwiftUI

struct ResultView: View {
    var choice: String
    
    var body: some View {
        Text("You chose \(choice)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("You're going to flip a coin. Heads or tails?")
                NavigationLink(destination: ResultView(choice: "Heads")) {
                    Text("Choose heads")
                }
                NavigationLink(destination: ResultView(choice: "Tails")) {
                    Text("Choose tails")
                }
            }
            .navigationBarTitle("Navigation")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
