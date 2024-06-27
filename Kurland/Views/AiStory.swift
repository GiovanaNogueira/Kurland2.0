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
                Image("FundoAmarelo")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    
                    Text(dao.story.title)
                        .font(.custom("PatrickHand-Regular", size: 40))
                        .foregroundStyle(.white)
                        .padding(.bottom, 30)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width: (geometry.size.width / 2) - (942.59 / 2))
                            ForEach(dao.story.story.indices, id: \.self ){ index in
                                VStack{
                                    Text(dao.story.story[index])
                                        .padding(50)
                                }
                                .frame(width: 942.59, height: 536.86)
                                .background(Color.brightPurple)
                                .font(.custom("PatrickHand-Regular", size: 40))
                                .cornerRadius(20)
                                .foregroundColor(.white)
                                .padding(.trailing, 90)
                            }
                        }
                    }
                }
            }
        }
    }
}


//#Preview {
//    AiStory()
//}
