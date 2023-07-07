//
//  ContentView.swift
//  betterRest
//
//  Created by Yazan Ghunaim on 7/4/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = "Error"
    @State private var alertMessage = "Oops, something went wrong.."
    @State private var showingAlert = false
    
    var recommendedSleepTime: Date {
        do {
            let config = MLModelConfiguration()
            let model = try BetterRestML(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 3600
            let mins = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + mins), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            return wakeUp - prediction.actualSleep
        } catch {
            showingAlert = true
        }
        return Date.now
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section (header: Text("When do you want to wake up?") ) {
                    DatePicker("Please pick a wake up time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Picker(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", selection: $coffeeAmount) {
                        ForEach(1..<21) {
                            Text("\($0)")
                                .tag($0)
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                
                Section(header: Text("Recommended BedTime")) {
                    VStack (alignment: .leading) {
                        Text("\(recommendedSleepTime.formatted(date: .omitted, time: .shortened))")
                            .font(.largeTitle)
                    }
                }
            }
            .navigationTitle("BetterRest")
            
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
