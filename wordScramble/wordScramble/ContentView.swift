//
//  ContentView.swift
//  wordScramble
//
//  Created by Yazan Ghunaim on 7/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var newWord = ""
    @State private var rootWord = ""
    
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
                }
                
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
                
                Section("Score") {
                    Text("\(score)")
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
            
            .toolbar {
                ToolbarItem {
                    Button("Start Game") {startGame()}
                }
            }
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        let letterCount = answer.count
        guard letterCount > 0 else { return }
        
        guard wordChecks(answer: answer) else {
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        score += letterCount * usedWords.count
        newWord = ""
    }
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "yazanghunaim"
                score = 0
                usedWords.removeAll()
                return
            }
        }
        
        fatalError("Could not load start.txt from bunlde.")
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
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
    
    func lengthCheck(word: String) -> Bool {
        word.count > 2
    }
    
    func startWord(word: String) -> Bool {
        word != rootWord
    }
    
    func wordChecks(answer: String) -> Bool{
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original!")
            
            return false
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "you cant spel that word from '\(rootWord)'!")
            
            return false
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You cant just make them up you know!")
            
            return false
        }
        
        guard lengthCheck(word: answer) else {
            wordError(title: "Word too short", message: "Word must be atleast 3 characters!")
            
            return false
        }
        
        guard startWord(word: answer) else {
            wordError(title: "Cant count that one ;)", message: "Try be more creative!")
            
            return false
        }
        
        return true
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
