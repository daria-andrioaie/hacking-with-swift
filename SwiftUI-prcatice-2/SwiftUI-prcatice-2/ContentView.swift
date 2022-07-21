//
//  ContentView.swift
//  SwiftUI-prcatice-2
//
//  Created by Daria Andrioaie on 20.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Group {
            // stacks
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

            // buttons
            Group {
                Button("Delete selection", role: .destructive, action: executeDelete)
                VStack {
                    Button("Button1") {

                    }.buttonStyle(.bordered)
                    Button("Button2") {

                    }.buttonStyle(.borderedProminent)
                        .tint(.mint)
                    Button("Button3", role: .destructive) {

                    }.buttonStyle(.bordered)
                    Button("Button4", role: .destructive) {

                    }.buttonStyle(.borderedProminent)
                    Button {
                        print("Button was tapped")
                    } label: {
                        Text("Tap me!")
                            .padding()
                            .foregroundColor(.white)
                            .background(.red)
                    }
                }
            }

            // images
            Group {
                Image(systemName: "pencil")
                Button {
                    print("Pencil button")
                } label: {
                    // Image(systemName: "pencil").renderingMode(.original)
                    // to keep the original color of the image, rather than Swift making it blue to show that they are tapable
                    Label("Edit", systemImage: "pencil")
                }
            }

            
            // alert messages
            // alerts are a function the state
            Group {
                Button("Show alert") {
                    showingAlert = true
                }
                .alert("Important message", isPresented: $showingAlert) {
                    // the button inside the alert will automatically dismiss the alert
                    Button("Cancel", role: .cancel) { }
                    Button("Delete", role: .destructive) { }
                } message: {
                    Text("Please read this")
                }
            }
        }
    }
    
    func executeDelete() {
        print("Now deleting")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
