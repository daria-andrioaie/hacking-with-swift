//
//  ContentView.swift
//  Intro_to_SwiftUI
//
//  Created by Daria Andrioaie on 18.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    @State private var name = ""
    
    let students = ["Paul", "Daria", "Anna"]
    @State private var selectedStudent = "Paul"

    var body: some View {
        Button("Tap Count: \(tapCount)"){
            tapCount += 1
        }
        
        Form {
            TextField("Enter some text here", text: $name)
            Text("Your name is \(name)")
        }
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
