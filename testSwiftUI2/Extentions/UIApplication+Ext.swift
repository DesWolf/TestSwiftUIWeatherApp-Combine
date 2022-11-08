//
//  UIApplication+Ext.swift
//  testSwiftUI2
//
//  Created by Max Okuneev on 23.10.2022.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
