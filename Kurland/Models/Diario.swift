//
//  Diario.swift
//  Kurland
//
//  Created by Giovana Nogueira on 20/06/24.
//

import Foundation
import UIKit

struct Entry: Codable, Identifiable {
    let id: UUID
    var titulo: String
    var img: String?
    var corpo: String
    let data: Date
}


func formatDates(from date: Date) -> (fullFormat: String, abbreviatedFormat: String) {
    let dateFormatter = DateFormatter()
    let locale = Locale(identifier: "en_US_POSIX") // Define o Locale para inglês
    dateFormatter.locale = locale
    
    // Formatando a data completa "Wednesday 19 June"
    dateFormatter.dateFormat = "EEEE, MMMM dd"
    let fullFormat = dateFormatter.string(from: date)
    
    // Formatando a data abreviada "Wed 19 Jun"
    dateFormatter.dateFormat = "EEE, MMM dd"
    let abbreviatedFormat = dateFormatter.string(from: date)
    
    return (fullFormat, abbreviatedFormat)
}
