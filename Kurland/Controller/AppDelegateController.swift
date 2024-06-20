//
//  AppDelegateController.swift
//  Kurland
//
//  Created by Giovana Nogueira on 20/06/24.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationWillTerminate(_ application: UIApplication) {
        // Salvar a cena atual quando o aplicativo for encerrado
        dao.cenaAtual = .abertura
        do {
            try DAO.instance.save()
        } catch {
            print("Erro ao salvar DAO: \(error)")
        }
        print("Aplicativo será fechado")
    }
}
