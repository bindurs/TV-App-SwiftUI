//
//  Extension.swift
//  TV APP SWiftUI
//
//  Created by Bindu  on 17/02/21.
//

import Foundation
import SwiftUI


extension String {
    
    var dateToString: String {
        
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = AppConstants.dateFormatApi
            
            let date: Date = dateFormatter.date(from: self)!
            dateFormatter.dateFormat = AppConstants.dateFormat
            
            return dateFormatter.string(from: date)
    }
    
    var removeTags: String {
        let str = self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        return str
    }
}
