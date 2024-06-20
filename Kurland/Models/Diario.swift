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
    let titulo: String
//    let img: UIImage?
    let corpo: String
    let data: Date
}
