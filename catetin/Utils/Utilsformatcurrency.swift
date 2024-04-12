//
//  Utilsformatcurrency.swift
//  catetin
//
//  Created by aldinugroho on 12/04/24.
//

import Foundation

func UtilsFormatCurrency(_ number: Int) -> String {
    let isNegative = number < 0
    let absoluteNumber = abs(number)
    
    if absoluteNumber >= 0 && absoluteNumber < 1000 {
        // For numbers between 0 and 1000, return the string representation without any formatting
        return String(Int(absoluteNumber))
    } else {
        // Convert the number to a string and insert a dot for every three digits from the right
        let numberString = String(absoluteNumber)
        var formattedString = ""
        var count = 0
        
        for char in numberString.reversed() {
            if count > 0 && count % 3 == 0 {
                formattedString = ".\(formattedString)"
            }
            formattedString = "\(char)\(formattedString)"
            count += 1
        }
        
        if isNegative {
            formattedString = "-\(formattedString)"
        }
        
        return formattedString
    }
}
