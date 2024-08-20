//
//  Tela2.swift
//  Kurland
//
//  Created by Giovana Nogueira on 19/06/24.
//

import Foundation
import SwiftUI

struct Tela2: View {
    @Binding var cenaAtual:Cena
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                ZStack{
                    Image("BalaoIntro")
                    Text("HI THERE! I'M AYANA, A PROUD CITIZEN \nOF KURLAND, ONCE A HARMONIOUS AND \nJOYOUS KINGDOM WHERE ENCHANTMENT \nFLOWS FROM THE QUEEN'S MAGICAL HAIR!").font(.custom("PatrickHand-Regular", size: 24)).multilineTextAlignment(.center)
                        .padding(.leading)
                }
                Spacer()
                    
            }
            Spacer()
            Spacer()
            Spacer()
            HStack{
                Button(action: {
                    dao.cenaAtual = .abertura
                }, label: {
                    Image("BtnPrevAmarelo").padding(.bottom, 20).padding(.leading, 29)
                })
                Spacer()
                Button(action: {
                    dao.cenaAtual = .ayanaTriste
                }, label: {
                    Image("BtnNext").padding(.trailing, 29).padding(.bottom, 20)
                })
            }
        }.background(Image("Tela2")
            .resizable()
            .ignoresSafeArea()
            .scaledToFill())

    }
        
}

#Preview {
    Tela2(cenaAtual: .constant(.introducao))
}
