//
//  ContentView.swift
//  SwiftUI-prcatice-2
//
//  Created by Daria Andrioaie on 20.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Group {
            HStack {
                VStack {
                    Text("hi1")
                    Text("hi4")
                    Text("hi7")
                }
                VStack {
                    Text("hi2")
                    Text("hi5")
                    Text("hi8")
                }
                VStack {
                    Text("hi3")
                    Text("hi6")
                    Text("hi9")
                }
            }
        }
        
        // colors
        ZStack {
            VStack(spacing: 0) {
                Color.red
                Color.blue
            }
            // primary is the default color of the text
            // .secondary is the secondary color of the text
            //Color.primary
            //Color(red: 1, green: 0.3, blue: 0.4)
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
            
            // if you want to ignore Apple's safe area, you have to add the "ignoreSafeArea modifier"
            // DO NOT put important content in the safe area
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
