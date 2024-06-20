//
//  DiarySwipe.swift
//  Kurland
//
//  Created by Giovana Nogueira on 20/06/24.
//

import SwiftUI

struct DiarySwipe: View{
    
    var diario = [Entry(id: UUID(), titulo: "Dia no shopping", corpo: "Eu fui no shopping e foi muito legal", data: Date())/*, Entry(id: UUID(), titulo: "Dia no praia", corpo: "Eu fui no shopping e foi muito legal", data: Date()) */]
    
    var body: some View {
        
        ZStack{
            Image("FundoAmarelo")
                .resizable()
                .ignoresSafeArea()
            TabView{
                VStack {
                    ForEach(diario){ entry in
                        VStack(alignment: .leading){
                            Text(entry.titulo)
                                .font(.custom("PatrickHand-Regular", size: 60))
                            Text(entry.corpo)
                        }
                        .frame(width: 942.59, height: 536.86)
                        .background(Color.brightPurple)
                        .font(.custom("PatrickHand-Regular", size: 40))
                        .cornerRadius(20)
                        .foregroundColor(.white)
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
    }
}


#Preview {
    DiarySwipe()
}
