//
//  Double+Ext.swift
//  testSwiftUI2
//
//  Created by Max Okuneev on 19.10.2022.
//

import Foundation

extension Double {
    static var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter
    }

    static var numberFormatter2: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        return numberFormatter
    }
}
