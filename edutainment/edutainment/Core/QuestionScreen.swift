//
//  QuestionScreen.swift
//  edutainment
//
//  Created by Yazan Ghunaim on 7/28/23.
//

import SwiftUI

struct QuestionScreen: View {
    let tableValue: Int
    let numberOfQuestions: Int
    
    @State private var score = 0
    @State private var currIndex = 0
    @State private var answered = false
    @State private var questions: [Question] = []
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack {
            if currIndex < questions.count {
                VStack {
                    ZStack(alignment: .leading) {
                        VStack {
                            Text(questions[currIndex].question)
                                .foregroundColor(.black)
                                .font(.title)
                                .padding()
                            
                            ForEach(questions[currIndex].options, id: \.self) { option in
                                Button {
                                    checkAnswer(option)
                                } label: {
                                    Text("\(option)")
                                        .foregroundColor(.white)
                                        .font(.title)
                                }
                                
                            }
                            .padding(.vertical, 5)
                        }
                        .frame(width: 250, height: 300)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                    }
                    
                    Text("Score: \(score)")
                        .font(.largeTitle.bold())
                }
                .shadow(radius: 15)
            } else {
                // Show a message when all questions are answered
                Text("Quiz Complete!")
                    .font(.largeTitle.bold())
                
                Text("Your score is \(score)/\(numberOfQuestions)!")
                    .font(.largeTitle.bold())
                
                Spacer()
                
                Button {
                    restart()
                } label: {
                    Text("Play Again")
                        .font(.largeTitle.bold())
                }

            }
        }
        .onAppear {
            for index in 1...numberOfQuestions {
                questions.append(Question(multiplicand: tableValue, multiplier: index))
            }
        }
    }
    
    func checkAnswer(_ option: Int) {
        if option == questions[currIndex].answer {
            score += 1
        }
        currIndex += 1
    }
    
    func restart() {
        mode.wrappedValue.dismiss()
    }
}

struct QuestionScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuestionScreen(tableValue: 5, numberOfQuestions: 5)
    }
}
