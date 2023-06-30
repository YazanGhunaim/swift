//
//  ContentView.swift
//  rockPaperScissors
//
//  Created by Yazan Ghunaim on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var computerMove = Int.random(in: 0...2)
    @State private var playerMove = 0
    @State private var winOrLose = Bool.random() // true -> Win
    @State private var showScore = false
    @State private var score = 0
    @State private var alertMessage = ""
    @State private var rounds = 1
    @State private var endGame = false
    
    var goal: String {
        winOrLose ? "You must win!" : "You must lose!"
    }
    
    let moves = [
        0: "Rock",
        1: "Paper",
        2: "Scissors"
    ]
    
    let images = ["wake.circle","paperplane","scissors"]
    
    var body: some View {
        finalView
    }
    
    func playerPlayed() {
        switch winOrLose
        {
        case true:
            if(computerMove == 0) {
                if(moves[playerMove] == moves[1]) {
                    score += 1
                    alertMessage = "nice!"
                }
                else {
                    alertMessage = "oops :("
                }
            }
            else if(computerMove == 1) {
                if(moves[playerMove] == moves[2]) {
                    score += 1
                    alertMessage = "nice!"
                }
                else {
                    alertMessage = "oops :("
                }
            }
            else {
                if(moves[playerMove] == moves[0]) {
                    score += 1
                    alertMessage = "nice!"
                }
                else {
                    alertMessage = "oops :("
                }
            }
            
        case false:
            if(computerMove == 0) {
                if(moves[playerMove] != moves[1]) {
                    score += 1
                    alertMessage = "nice!"
                }
                else {
                    alertMessage = "oops :("
                }
            }
            else if(computerMove == 1) {
                if(moves[playerMove] != moves[2]) {
                    score += 1
                    alertMessage = "nice!"
                }
                else {
                    alertMessage = "oops :("
                }
            }
            else {
                if(moves[playerMove] != moves[0]) {
                    score += 1
                    alertMessage = "nice!"
                }
                else {
                    alertMessage = "oops :("
                }
            }
        }
        showScore = true
        
        rounds == 0 ? (endGame = true) : (rounds -= 1)
    }
    
    func playRound() {
        winOrLose.toggle()
        computerMove = Int.random(in: 0...2)
    }
    
    func resetGame() {
        playRound()
        rounds = 1
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    
    var background: some View {
        RadialGradient(stops: [.init(color: .black, location: 5),
                               .init(color: .blue, location: 5)],
                       center: .topLeading, startRadius: 1000, endRadius: 500)
        .ignoresSafeArea()
    }
    
    var textSection: some View {
        Group {
            Text(goal)
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 200, height: 55)
                .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.black))
                .padding(.top)
            
            Text("My Move: \(moves[computerMove] ?? "ERROR")")
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 200, height: 55)
                .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.black))
                .padding(.top)
            
            Text("Your Move")
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 200, height: 55)
                .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.black))
                .padding(.top)
        }
    }
    
    var playButtons: some View {
        HStack {
            ForEach(0 ..< 3) { number in
                Button {
                    playerMove = number
                    playerPlayed()
                } label: {
                    Image(systemName: images[number])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                }
                Spacer()
                Spacer()
            }
        }.padding()
    }
    
    var finalView: some View {
        ZStack {
            background
            VStack (alignment: .center, spacing: 10){
                textSection
                playButtons
                
                Spacer()
                
                Text("Score: \(score)")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.blue))
                Spacer()
            }.padding()
        }
        
        .alert(alertMessage, isPresented: $showScore) {
            Button("continue", action: playRound)
        }message: {
            Text("Your Score is now \(score)")
        }
        
        .alert("Game Over", isPresented: $endGame) {
            Button("Try again", action: resetGame)
        } message: {
            Text("You have played enough")
        }
    }
}
