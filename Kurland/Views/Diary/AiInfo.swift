//
//  AiInfo.swift
//  Kurland
//
//  Created by Giovana Nogueira on 26/06/24.
//

import SwiftUI

struct AiInfo: View {
    var body: some View {
        ZStack{
            Image("FundoRoxo")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("Stars")
                    .padding(.bottom, 20)
            
                Text("Every time you make a new entry, you're adding a \npiece to your own adventure. But guess what? After \nyou write 5 entries, something magical happens! \nYou'll get a special surprise – a unique story \ncreated just for you by a super-smart friend \ncalled AI, or Artificial Intelligence. ")
                    .font(.custom("PatrickHand-Regular", size: 36))
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                Spacer()
                HStack{
                    Button{
                        dao.cenaAtual = .genarateAI
                    }label: {
                        Image("BtnPrevAmarelo")
                    }
                    .padding(.bottom, 20)
                    .padding(.leading, 50)
                    Spacer()
                }
                
            }
        }
    }
}

#Preview {
    AiInfo()
}
