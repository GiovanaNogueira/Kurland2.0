//
//  ConversaFinal1.swift
//  Kurland
//
//  Created by Giovana Nogueira on 19/06/24.
//

import Foundation
import SwiftUI

struct ConversaFinal1: View {
    @Binding var cenaAtual: Cena
    @Binding var lastIsNatu: Bool
    
    
    var nomeImgFundo: String {
        if lastIsNatu {
            SoundPlayer.shared.stopEffects()
            return "ConvFinal1Natu"
        }
        
        else{
            SoundPlayer.shared.stopEffects()
            return "ConvFinal1Tranca"
        }
    }
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Button(action: {
                    dao.cenaAtual = .rioCastelo
                }, label: {
                    Image("BtnPrevAmarelo").padding(.leading, 29).padding(.bottom, 20)
                })
                Spacer()
                Button(action: {
                    dao.cenaAtual = .convFinal2
                }, label: {
                    Image("BtnNext").padding(.trailing, 29).padding(.bottom, 20)
                })
            }
        }.background(Image(nomeImgFundo)
            .resizable()
            .ignoresSafeArea()
            .scaledToFill())
    }
}

#Preview {
    ConversaFinal1(cenaAtual: .constant(.convFinal1), lastIsNatu: .constant(true))
}

#Preview {
    ConversaFinal1(cenaAtual: .constant(.convFinal1), lastIsNatu: .constant(false))
}
