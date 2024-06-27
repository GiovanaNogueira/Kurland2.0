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
    var idEntry: UUID? = nil
    var isEditing: Bool = false
    var entryList: [String] = []
    var story: Story = Story(title: "", story: [])
    
    
    private init() {}
    
    func removeEntry(by id: UUID) {
           diario.removeAll { $0.id == id }
       }
}


