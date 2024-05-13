//
//  Date+Ext.swift
//  Appetizers
//
//  Created by motomura on 2024/05/13.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date()) ?? Date()
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date()) ?? Date()
    }
}
