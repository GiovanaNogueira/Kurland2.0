//
//  ConversaFinal2.swift
//  Kurland
//
//  Created by Giovana Nogueira on 19/06/24.
//

import Foundation
import SwiftUI

struct ConversaFinal2: View {
    @Binding var cenaAtual:Cena
    @Binding var lastIsNatu: Bool
    
    var nomeImgFundo: String {
        if lastIsNatu {
            return "ConvFinal2Natu"
        }
        
        else{
            return "ConvFinal2Tranca"
        }
    }
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Button(action: {
                    dao.cenaAtual = .convFinal1
                }, label: {
                    Image("BtnPrevAmarelo").padding(.leading, 29).padding(.bottom, 20)
                })
                Spacer()
                Button(action: {
                    dao.cenaAtual = .princesas
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
    ConversaFinal2(cenaAtual: .constant(.convFinal2), lastIsNatu: .constant(true))
}

#Preview {
    ConversaFinal2(cenaAtual: .constant(.convFinal2), lastIsNatu: .constant(false))
}
