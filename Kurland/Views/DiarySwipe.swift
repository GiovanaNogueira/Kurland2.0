//
//  DiarySwipe.swift
//  Kurland
//
//  Created by Giovana Nogueira on 20/06/24.
//

import SwiftUI

struct DiarySwipe: View{

    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("FundoAmarelo")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    
                    if dao.diario.isEmpty{
                        Button {
                            dao.cenaAtual = .diaryEntry
                        } label: {
                                VStack{
                                    
                                    Text("Your Diary entries will appear here. \nClick on the + to write!")
                                        .font(.custom("PatrickHand-Regular", size: 32))
                                        .foregroundStyle(Color.white)
                                }
                                .frame(width: 942.59, height: 536.86)
                                .background(Color.brightPurple)
                                .cornerRadius(20)
                                .padding(.top, 80)
                        }
                    }else{
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: (geometry.size.width / 2) - (942.59 / 2))
                                ForEach(dao.diario){ entry in
                                    Button{
                                        dao.idEntry = entry.id
                                        dao.cenaAtual = .diaryDisplay
                                    }label: {
                                        
                                        VStack{
                                            HStack{
                                                if let imageData = entry.img, let image = stringToImage(imageData) {
                                                    Image(uiImage: image)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                                        .shadow(radius: 2)
                                                        .frame(width: 402, height: 464)
                                                }
                                                VStack(alignment: .leading){
                                                    Text(entry.titulo)
                                                        .font(.custom("PatrickHand-Regular", size: 60))
                                                    Text(entry.corpo)
                                                        .padding(.bottom, 30)
                                                    
                                                    Text(formatDates(from: entry.data).fullFormat)
                                                        .font(.custom("PatrickHand-Regular", size: 28))
                                                    
                                                }
                                                .padding(50)
                                            }
                                            .padding(.leading, 20)
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
                    Spacer()
                    HStack{
                        Button{
                            dao.cenaAtual = .abertura
                        }label: {
                            Image("BtnPrevAmarelo")
                                .padding(.bottom, 20)
                                .padding(.leading, 50)
                        }
                        Spacer()
                        Button{
                            dao.cenaAtual = .diaryEntry
                        }label: {
                            Image("BtnAddRoxo")
                                .padding(.bottom, 20)
                                .padding(.trailing, 50)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    DiarySwipe()
}
