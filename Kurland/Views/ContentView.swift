//
//  ContentView.swift
//  Kurland
//
//  Created by Giovana Nogueira on 19/06/24.
//

import SwiftUI


struct ContentView: View {
    @Binding var cenaAtual:Cena
    var body: some View {
        ZStack{
            Image("Tela1")
                .resizable()
                .ignoresSafeArea()
            VStack{
                HStack(spacing: 40){
                    Button(action: {
                        dao.cenaAtual = .introducao
                    }, label: {
                        VStack(spacing: 15){
                            Image("BtnPlay")
                                .resizable()
                                .frame(width: 129.92, height: 129.92)
                            Text("Play")
                                .font(.custom("PatrickHand-Regular", size: 32))
                                .foregroundStyle(Color.white)
                                .shadow(radius: 2)
                        }
                    })
                    Button(action: {
                        dao.cenaAtual = .diarySwipe
                    }, label: {
                        VStack(spacing: 15){
                            Image("BtnDiary")
                                .resizable()
                                .frame(width: 129.92, height: 129.92)
                            Text("Diary")
                                .font(.custom("PatrickHand-Regular", size: 32))
                                .foregroundStyle(Color.white)
                                .shadow(radius: 2)
                        }
                        //
                    })
                }
            }
            .padding(.top, 200)
        }
    }
}

#Preview {
    ContentView(cenaAtual: .constant(.abertura))
}
