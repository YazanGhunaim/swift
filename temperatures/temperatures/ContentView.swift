//
//  ContentView.swift
//  temperatures
//
//  Created by Yazan Ghunaim on 6/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var degreeInput = 0.0
    @State private var unitSelectionFrom = "C"
    @State private var unitSelectionTo = "F"
    @FocusState private var isFocused: Bool
    
    var result : Double? {
        if unitSelectionFrom == "C" {
            switch unitSelectionTo {
            case "F": return (degreeInput * 9/5) + 32
            case "K": return degreeInput + 273.15
            default: break
            }
        }
        else if unitSelectionFrom == "F" {
            switch unitSelectionTo {
            case "C": return (degreeInput - 32) * 5/9
            case "K": return (degreeInput + 459.67) * 5/9
            default: break
            }
        }
        else {
            switch unitSelectionTo {
            case "C": return degreeInput - 273.15
            case "F": return (degreeInput * 9/5) - 459.67
            default: break
            }
        }
        return nil
    }
    
    let units = ["C","F","K"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Degrees", value: $degreeInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                } header: {
                    Text("degrees input")
                }
                
                Section {
                    Picker("From", selection: $unitSelectionFrom) {
                        ForEach(units, id : \.self) {
                            Text("\($0)")
                        }
                    }
                    Picker("To", selection: $unitSelectionTo) {
                        ForEach(units.filter {
                            $0 != unitSelectionFrom
                        }, id: \.self) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Measurment units")
                }
                
                Section {
                    Text(result ?? 0.0, format: .number)
                } header: {
                    Text("Conversion")
                }
            }
            .navigationTitle("Conversions")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isFocused = false
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
