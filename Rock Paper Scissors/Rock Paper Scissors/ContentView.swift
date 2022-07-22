//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Daria Andrioaie on 22.07.2022.
//

import SwiftUI

struct ContentView: View {
    let gameStates = ["rock", "paper", "scissors"]
    let desiredPlayerActions = ["win", "lose"]
    @State private var currentGameState = Int.random(in: 0...2)
    @State private var desiredPlayerAction = Int.random(in: 0...1)
    
    @State private var playerAction = -1
    
    @State private var score = 0
    @State private var currentRound = 1
    let maximumNumberOfRounds = 5
    @State private var isGameOver = false
    
    var body: some View {
        Group {
            Spacer()
            Image(gameStates[currentGameState])
                .resizable()
                .frame(maxWidth: 130, maxHeight: 130)
            Spacer()
            Text("What do you choose in order to")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("\(desiredPlayerActions[desiredPlayerAction])?")
                .font(.largeTitle)
            Spacer()
            HStack {
                ForEach(0..<3) { number in
                    Button {
                        assessPlayerAction(number)
                    } label: {
                        Image(gameStates[number])
                            .resizable()
                            .frame(maxWidth: 70, maxHeight: 70)
                            .padding([.leading, .trailing], 10)
                    }
                }
            }
            Spacer()
            Text("Your score: \(score)")
        }
        .alert("Game over", isPresented: $isGameOver) {
            Button("Exit", role: .cancel) {
                exit(0)
            }
            Button("Try again", action: resetGame)
        } message: {
            Text("Your score is \(score).")
        }
    }
    
    func resetRound() {
        if currentRound == maximumNumberOfRounds {
            isGameOver = true
            return
        }
        currentRound += 1
        currentGameState = Int.random(in: 0...2)
        desiredPlayerAction =  Int.random(in: 0...1)
        print("Player score: \(score)")
    }
    
    func resetGame() {
        currentRound = 1
        score = 0
        currentGameState = Int.random(in: 0...2)
        desiredPlayerAction =  Int.random(in: 0...1)
    }
    
    func assessPlayerAction(_ number: Int) {
        playerAction = number

        switch gameStates[currentGameState] {
        case "rock":
            switch desiredPlayerActions[desiredPlayerAction] {
            case "win":
                if gameStates[playerAction] == "paper" {
                    score += 1
                }
            case "lose":
                if gameStates[playerAction] == "scissors" || gameStates[playerAction] == "rock" {
                    score += 1
                }
            default:
                print("unexpected value in desiredPlayerActions array")
            }
        case "paper":
            switch desiredPlayerActions[desiredPlayerAction] {
            case "win":
                if gameStates[playerAction] == "scissors" {
                    score += 1
                }
            case "lose":
                if gameStates[playerAction] == "rock" || gameStates[playerAction] == "paper" {
                    score += 1
                }
            default:
                print("unexpected value in desiredPlayerActions array")
            }
        case "scissors":
            switch desiredPlayerActions[desiredPlayerAction] {
            case "win":
                if gameStates[playerAction] == "rock" {
                    score += 1
                }
            case "lose":
                if gameStates[playerAction] == "paper" || gameStates[playerAction] == "scissors"{
                    score += 1
                }
            default:
                print("unexpected value in desiredPlayerActions array")
            }
        default:
           print("unexpected value in gameStates array")
        }
        
        resetRound()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
