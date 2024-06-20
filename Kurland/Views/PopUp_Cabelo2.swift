//
//  PopUp_Cabelo2.swift
//  Kurland
//
//  Created by Giovana Nogueira on 19/06/24.
//

import Foundation
import SwiftUI

struct PopUp_Cabelo2: View {
    
    @Binding var cenaAtual:Cena
    
    var body: some View {
        ZStack {
            Image("PopUp_Cabelo2")
                .resizable()
                .scaledToFit()
                .overlay{
                    VStack{
                        
                        Spacer()
                        HStack{
                            Spacer()
                            Button{
                                dao.cenaAtual = .jogoPedra
                            } label: {
                                Image("BtnNext")
                                
                            }
                            .padding(.bottom, 70)
                            .padding(.trailing, 70)
                        }
                    }
                }
        }
    }
}

#Preview {
    PopUp_Cabelo2(cenaAtual: .constant(.primEscolha))
}
