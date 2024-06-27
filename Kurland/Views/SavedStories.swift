//
//  DiarySwipe.swift
//  Kurland
//
//  Created by Giovana Nogueira on 20/06/24.
//

import SwiftUI

struct SavedStories: View{
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Image("FundoAmarelo")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack{
                    
                    if dao.savedStories.isEmpty{
                        Button {
                            dao.cenaAtual = .diaryEntry
                        } label: {
                                VStack{
                                    
                                    Text("Your saved stories will appear here. \nClick on the + to write!")
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
                                
                                ForEach(dao.savedStories, id: \.self){ story in
                                    Button{
                                        
                                        dao.story = story
                                        dao.cenaAtual = .showingStory
                                    }label: {
                                        
                                        VStack{
                                                VStack(alignment: .leading){
                                                    Text(story.title.uppercased())
                                                        .font(.custom("PatrickHand-Regular", size: 60))
                                                        .padding(.bottom, 10)
                                                    Text(story.story[0])
                                                        .padding(.bottom, 30)
                                                    
                                                }
                                                .padding(50)
                                                .multilineTextAlignment(.leading)
                                            
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
                            dao.cenaAtual = .diarySwipe
                        }label: {
                            Image("BtnPrevAmarelo")
    
                        }
                        .padding(.bottom, 20)
                        .padding(.leading, 50)
                        Spacer()
                        
                        HStack(spacing: 5){
                            Button{
                                dao.cenaAtual = .genarateAI
                            }label: {
                                Image("BtnAi")
                                   
                            }
                            .padding(.bottom, 20)
                            .padding(.trailing, 50)
                            
                            Button{
                                dao.cenaAtual = .diaryEntry
                            }label: {
                                Image("BtnAddRoxo")
                            }
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
    SavedStories()
}
