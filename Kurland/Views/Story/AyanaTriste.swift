//
//  Tela3.swift
//  Kurland
//
//  Created by Giovana Nogueira on 19/06/24.
//

import Foundation
import SwiftUI

struct AyanaTriste: View {
    @Binding var cenaAtual:Cena
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Button(action: {
                    dao.cenaAtual = .introducao
                }, label: {
                    Image("BtnPrevVerde").padding(.bottom, 20).padding(.leading, 29)
                })
                Spacer()
                Button(action: {
                    dao.cenaAtual = .espelho
                }, label: {
                    Image("BtnNext").padding(.trailing, 29).padding(.bottom, 20)
                })
            }
        }.background(Image("Tela3")
            .resizable()
            .ignoresSafeArea()
            .scaledToFill())

            
    }
}

#Preview {
    AyanaTriste( cenaAtual: .constant(.ayanaTriste))
}


