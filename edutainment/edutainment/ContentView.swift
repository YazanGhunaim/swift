//
//  ContentView.swift
//  edutainment
//
//  Created by Yazan Ghunaim on 7/23/23.
//

import SwiftUI


struct ContentView: View {
    @State private var tableValue = 2
    @State private var numberOfQuestions = 5
    @State private var startGame = false
    
    let questionNumbers = [5,10,15]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 35) {
                HStack(spacing: 25) {
                    Stepper("multiplication table:", value: $tableValue, in: 2...12)
                    
                    Text("\(tableValue)")
                }
                
                //..//
                VStack(alignment: .leading) {
                    Text("Number of questions:")
                    Picker("Number of questions", selection: $numberOfQuestions) {
                        ForEach(questionNumbers, id: \.self) {
                            Text("\($0)").tag($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                //...//
                startButton
                
                //..//
            }
            .padding()
            
            Spacer()
            
            
                .padding(0)
                .navigationDestination(isPresented: $startGame) {
                    QuestionScreen(tableValue: tableValue, numberOfQuestions: numberOfQuestions)
                }
                .navigationTitle("Edutainment")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    var startButton: some View {
        Button {
            startGame.toggle()
        } label: {
            Text("start")
                .font(.largeTitle)
                .foregroundColor(.black)
        }
        .frame(width: 150, height: 175)
        .background(.gray)
        .clipShape(Circle())
    }
}
