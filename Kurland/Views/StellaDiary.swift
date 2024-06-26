//
//  StellaDiary.swift
//  Kurland
//
//  Created by Giovana Nogueira on 26/06/24.
//

import SwiftUI

struct StellaDiary: View {
    var body: some View {
        ZStack{
            Image("StelaDiary")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Button{
                    dao.cenaAtual = .genarateAI
                }label: {
                    Image("BtnDiaryRoxo")
                }
                
                Button{
                    dao.cenaAtual = .princesas
                }label: {
                    Image("BtnPrevAmarelo")
                }
            }
        }
    }
}

#Preview {
    StellaDiary()
}
