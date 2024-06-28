//
//  AiStory.swift
//  Kurland
//
//  Created by Giovana Nogueira on 27/06/24.
//

import SwiftUI

struct AiStory: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("FundoRoxo")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Text(dao.story.title.uppercased())
                        .font(.custom("PatrickHand-Regular", size: 40))
                        .foregroundStyle(.white)
                        .padding(.bottom, 30)
                        .padding(.top, 20)
                    
                    ScrollView(showsIndicators: false){
                        VStack{
                            ForEach(dao.story.story.indices, id: \.self ){ index in
                                VStack{
                                    Text(dao.story.story[index])
                                        .multilineTextAlignment(.center)
                                        .font(.custom("PatrickHand-Regular", size: 36))
                                        .foregroundStyle(.white)
                                        .lineLimit(nil)
                                    
                                }
//                                .frame(height: 500)
                                .padding(.bottom, 20)
                            }
                            
                            Spacer()
                            HStack{
                                Button{
                                    if let _ = dao.savedStories.first(where: { $0.story != dao.story.story}){
                                        dao.savedStories.append(dao.story)
                                    }
                                    dao.cenaAtual = .savedStories
                                }label: {
                                    Image("BtnPrevAmarelo")
                                }
                                Spacer()
                            }
                            .padding(.bottom, 20)
//                            .padding(.leading, 50)
                        }
                    }
                    .padding(.horizontal, 70)
                    
                   
                }
            }
        }
    }
}


//#Preview {
//    AiStory()
//}
