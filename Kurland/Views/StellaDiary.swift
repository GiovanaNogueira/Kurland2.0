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
            Image("StellaDiary")
                .resizable()
                .ignoresSafeArea()
            VStack{
                
                Spacer()
                Spacer()
                HStack{
                    Spacer()
                    Spacer()
                    Button{
                        dao.cenaAtual = .diarySwipe
                    }label: {
                        Image("BtnDiaryRoxo")
                            .resizable()
                            .frame(width: 203.38, height: 200.87)
                    }
                    .padding(.leading, 50)
                    .padding(.top, 100)
                    Spacer()
                }
                Spacer()
                HStack{
                    Button{
                        dao.cenaAtual = .princesas
                    }label: {
                        Image("BtnPrevAmarelo")
                    }
                    Spacer()
                }
                .padding(.bottom, 20)
                .padding(.leading, 50)
            }
        }
    }
}

#Preview {
    StellaDiary()
}
