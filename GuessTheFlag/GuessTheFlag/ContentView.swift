//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yazan Ghunaim on 6/19/23.
//

import SwiftUI

struct flagImage: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var score = 0
    @State private var showingScore = false
    @State private var gameEnded = false
    @State private var scoreTitle = ""
    @State private var userAnswer = 0
    @State private var roundLength = 7
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                                   .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                           center: .top,
                           startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess The Flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                
                
                VStack (spacing: 30) {
                    
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 20).weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            flagImage(imageName: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            } .padding()
            
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: askQuestion)
                } message: {
                    if scoreTitle == "Correct" {
                        Text("Your score is \(score)")
                    }
                    else {
                        Text("Wrong thats the flag of \(countries[userAnswer])")
                    }
                }
            
                .alert("Game Over!", isPresented: $gameEnded) {
                    Button("New Game!", action: reset)
                } message: {
                    Text("8 rounds of guessing are over, would you like to try again ?")
                }
        }
    }
    
    func checkGameOver() {
        roundLength == 0 ? (gameEnded = true) : (roundLength -= 1)
    }
    
    func flagTapped(_ number: Int) {
        userAnswer = number
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        }
        else {
            scoreTitle = "Wrong"
        }
        showingScore = true
        
        checkGameOver()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        askQuestion()
        roundLength = 7
        score = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
