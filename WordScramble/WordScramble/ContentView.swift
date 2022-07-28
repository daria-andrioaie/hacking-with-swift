//
//  ContentView.swift
//  WordScramble
//
//  Created by Daria Andrioaie on 26.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord  = ""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    @State private var score = 0
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                        .onSubmit {
                            addNewWord()
                        }
                }
                Text("Score: \(score)")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing)
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .toolbar(content: {
                Button("Restart") {
                    startGame()
                }
            })
            .navigationTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isValid(word: answer) else {
            wordError(title: "Word is invalid", message: "You cannot use the same word as '\(rootWord)'")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possile", message: "You can't spell that word from '\(rootWord)'")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognised", message: "You can't just make them up, you know?")
            return
        }
        
        score += answer.count
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    func startGame() {
        if let startWordsUrl = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsUrl) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                usedWords = []
                score = 0
                newWord = ""
                return
            }
            
            fatalError("Could not load start.txt from bundle")
        }
    }

    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isValid(word: String) -> Bool {
        word.count >= 3 && word != rootWord
    }
    
    func isPossible(word: String) -> Bool {
        var copy = rootWord
        
        for letter in word {
            if let pos = copy.firstIndex(of: letter) {
                copy.remove(at: pos)
            }
            else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
