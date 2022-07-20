//
//  ConversionController.swift
//  iConvert
//
//  Created by Daria Andrioaie on 20.07.2022.
//

import Foundation

class ConversionController {
    var inputUnit: LengthUnit = .meters
    var outputUnit: LengthUnit = .kilometers
    var inputValue: Double = 10.0
    let baseUnit: LengthUnit = .meters
    
    func convert() -> Double {
        let baseValue: Double
        // convert input unit to base
        switch inputUnit {
        case .meters:
            baseValue = inputValue
        case .kilometers:
            baseValue = inputValue * 1000
        case .feet:
            baseValue = inputValue / 3.28
        case .yards:
            baseValue = inputValue * 0.9144
        case .miles:
            baseValue = inputValue * 1609.344
        }
        
        let result: Double
        // convert base to output unit
        switch outputUnit {
        case .meters:
            result = baseValue
        case .kilometers:
            result = baseValue / 1000
        case .feet:
            result = baseValue * 3.28
        case .yards:
            result = baseValue / 0.9144
        case .miles:
            result = baseValue / 1609.344
        }
        
        return result
    }
}
