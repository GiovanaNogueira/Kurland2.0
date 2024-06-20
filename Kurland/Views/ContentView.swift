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
                Spacer()
                Button(action: {
                    dao.cenaAtual = .introducao
                }, label: {
                    Image("BtnPlay")
                        .padding(.top, 50)
                })
                Spacer()
                Button(action: {
                    dao.cenaAtual = .diaryEntry
                }, label: {
                    Text("My Diary")
//                        .padding(.top, 50)
                })
            }
        }
    }
}

#Preview {
    ContentView(cenaAtual: .constant(.abertura))
}
