//
//  ContentView.swift
//  Temperature Convertor
//
//  Created by Paul Mason on 6/29/20.
//  Copyright © 2020 Paul Mason. All rights reserved.
//
//this is an app that will take input in either celsius, farenheit or kelvin and output in the choice of celsius farenheit or kelvin
import SwiftUI

struct ContentView: View {
    //create state variable for user input
    @State private var result = 0.0
    @State private var userInput = ""
    //add a state variable to go through the typeSelections
    //need two because you have to keep track of both input and output types
    @State private var typeIndexOne = 0
    @State private var typeIndexTwo = 1
    //create an array for different input an output options
    let typeSelections = ["Fahrenheit", "Celsius", "Kelvin"]
    //create a computed property Double that will evaluate the input/output string and the userInput
    var outputAmount: Double? {
        let uInput = Double(userInput) ?? 0
        let iType = typeSelections[typeIndexOne]
        let oType = typeSelections[typeIndexTwo]
        var output: Double
        if iType == oType {
            output = uInput
        }else if iType == "Fahrenheit" && oType == "Celsius"{
            output = ((uInput - 32) * 5) / 9
        }else if iType == "Fahrenheit" && oType == "Kelvin"{
            output = (uInput + 457.67) * (5/9)
        }else if iType == "Celsius" && oType == "Fahrenheit"{
            output = (uInput * 1.8) + 32
        }else if iType == "Celsius" && oType == "Kelvin" {
            output = uInput + 273.15
        }else if iType == "Kelvin" && oType == "Fahrenheit"{
            output = 1.8 * (uInput - 273) + 32
        }else if iType == "Kelvin" && oType == "Celsius"{
            output = uInput - 273
        }else {
            output = 0
        }
        return output
    }

    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("What are the input and output types")){
                    Picker("Input Type", selection: $typeIndexOne){
                        ForEach(0 ..< typeSelections.count){
                            Text("\(self.typeSelections[$0])")
                        }
                    }
                    Picker("Output Type", selection: $typeIndexTwo){
                        ForEach(0 ..< typeSelections.count){
                            Text("\(self.typeSelections[$0])")
                        }
                    }
                }
                Section(header: Text("Enter your value")){
                    TextField("0.00", text: $userInput)
                        .keyboardType(.decimalPad)
                }
                //new section to print out the result of the function
                Section{
                    if outputAmount == nil {
                        Text("0.00")
                    }else {
                        Text("\(outputAmount!, specifier: "%.2f")")
                    }
                }
            }.navigationBarTitle("Temperature Converter", displayMode: .inline)
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
