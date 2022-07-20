//
//  ContentView.swift
//  iConvert
//
//  Created by Daria Andrioaie on 20.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit: LengthUnit = .meters
    @State private var outputUnit: LengthUnit = .kilometers
    @State private var inputValue: Double = 0.0
    @FocusState private var inputValueIsFocused: Bool
    
    private var conversionController = ConversionController()
    
    var result: Double {
        conversionController.inputValue = Double(inputValue)
        conversionController.inputUnit = inputUnit
        conversionController.outputUnit = outputUnit
        return conversionController.convert()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Your value:", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputValueIsFocused)
                } header: {
                    Text("Your value")
                }
                
                Section {
                    Picker("From", selection: $inputUnit) {
                        ForEach(LengthUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("From")
                }
                
                
                Section {
                    Picker("To", selection: $outputUnit) {
                        ForEach(LengthUnit.allCases, id: \.self) { unit in
                            Text(unit.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To")
                }
                
                Section {
                    Text(result, format: .number)
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("iConvert")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputValueIsFocused = false
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
