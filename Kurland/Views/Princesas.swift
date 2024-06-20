//
//  Princesas.swift
//  Kurland
//
//  Created by Giovana Nogueira on 19/06/24.
//

import Foundation
import SwiftUI

struct Princesas: View {
    @Binding var cenaAtual:Cena
    @Binding var lastIsNatu: Bool
    @Binding var hasFinished: Bool
    
    var nomeImgFundo: String {
        if lastIsNatu {
            return "PrincesasNatu"
        }
        
        else{
            return "PrincesasTranca"
        }
    }
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                HStack{
                    Button(action: {
                        dao.cenaAtual = .convFinal2
                    }, label: {
                        Image("BtnPrevAmarelo").padding(.leading, 29).padding(.bottom, 20)
                    })
                    Spacer()
                    if hasFinished{
                        Button(action: {
                            dao.cenaAtual = .theEnd
                        }, label: {
                            Image("BtnNext").padding(.trailing, 29).padding(.bottom, 20)
                        })
                    }
                }
            }
        }
        .background(Image(nomeImgFundo)
            .resizable()
            .ignoresSafeArea()
            .scaledToFill())
            .task {
                guard !hasFinished else { return }
                try? await Task.sleep(for: .seconds(3))
                cenaAtual = .theEnd
                await MainActor.run{
                    hasFinished = true
                }
            }
    }
}

#Preview {
    Princesas(cenaAtual: .constant(.princesas), lastIsNatu: .constant(true), hasFinished: .constant(true))
}

#Preview {
    Princesas(cenaAtual: .constant(.princesas), lastIsNatu: .constant(false), hasFinished: .constant(false))
}
