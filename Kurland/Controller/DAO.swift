//
//  DAO.swift
//  Kurland
//
//  Created by Giovana Nogueira on 20/06/24.
//

import Foundation
import CodableExtensions

let dao = DAO.instance

@Observable class DAO: Codable {
    static var instance = (try? DAO.load()) ?? DAO()
    
    var cenaAtual: Cena = .abertura
    var diario: [Entry] = []
    
    private init() {}
    
}


