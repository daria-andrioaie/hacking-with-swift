//
//  ContentView.swift
//  Lists-Strings-ResourcesManagement
//
//  Created by Daria Andrioaie on 26.07.2022.
//

import SwiftUI

struct ContentView: View {
    let people = ["finn", "leia", "luke", "ray"]
    var body: some View {
        VStack {
            
            
            // working with lists
            List(people, id: \.self){
                Text($0)
            }
            List(0..<5) {
                Text("Dynamic row \($0)")
    //            Section("Section1") {
    //                ForEach(0..<5) {
    //                    Text("Hi row \($0)")
    //                }
    //            }
    //            Section("Section2") {
    //                Text("Ana")
    //                Text("Banana")
    //            }
            }
            .listStyle(.grouped)
        }
    }
    
    // loading resources
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                print(fileContents)
            }
        }
    }
    
    func test() {
        let input = "a b c"
        // array of strings
        let letters = input.components(separatedBy: " ")
        let letter = letters.randomElement() ?? ""
        let trimmed = letter.trimmingCharacters(in: .whitespacesAndNewlines)
        
        print(trimmed)
        
        // spelling checking
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        
        let mispelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGod = mispelledRange.location == NSNotFound
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
