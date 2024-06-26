//
//  GenerateAI.swift
//  Kurland
//
//  Created by Giovana Nogueira on 26/06/24.
//

import SwiftUI

struct GenerateAI: View {
    var body: some View {
        ZStack{
            Image("FundoRoxo")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Image("Stars")
                    .padding(.bottom, 20)
                
                Text("YOUR VERY OWN KURLAND ADVENTURE")
                    .font(.custom("PatrickHand-Regular", size: 48))
                    .foregroundStyle(Color.white)
                
                Text("You need _ more entries to generate \nYour Very Own Kurland Adventure.")
                    .font(.custom("PatrickHand-Regular", size: 36))
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                Button{
                    
                }label: {
                    Image("BtnGenerate")
                }
                
                Button{
                    dao.cenaAtual = .aiInfo
                }label: {
                    Image("BtnInfo")
                }
                
            }
        }
    }
}

#Preview {
    GenerateAI()
}
