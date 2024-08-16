//
//  GenerateAI.swift
//  Kurland
//
//  Created by Giovana Nogueira on 26/06/24.
//

import SwiftUI

struct GenerateAI: View {
    
    @EnvironmentObject var aiManager: AIController
    
    let count = dao.entryList.count
    
    var canGenerate: Bool {
        return count == 5
    }
    var description: String {
        if canGenerate {
            return "Your adventure is ready!"
        }
        return "You need \(5 - count) more entries to generate \nYour Very Own Kurland Adventure."
    }
    
    var showSaved: Bool {
        return !dao.savedStories.isEmpty
    }
    var body: some View {
        ZStack{
            Image("FundoRoxo")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 20){
                Spacer()
                Image("Stars")
                    .padding(.bottom, 20)
                
                Text("YOUR VERY OWN KURLAND ADVENTURE")
                    .font(.custom("PatrickHand-Regular", size: 48))
                    .foregroundStyle(Color.white)
                
                Text(description)
                    .font(.custom("PatrickHand-Regular", size: 36))
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
//                    .padding(.bottom, 20)
                Spacer()
                Button{
                    Task{ @MainActor in
                        do{
                            try await aiManager.makeStory(using: dao.entryList)
//                            print("\(dao.story)")
                        }catch{
                            aiManager.appState = .diaryEntry
                            print(error.localizedDescription)
                        }
                    }  
                }label: {
                    Image("BtnGenerate")
                }
                .opacity(canGenerate ? 1 : 0.6 )
                .disabled(!canGenerate)
                
                Button{
                    dao.cenaAtual = .savedStories
                }label: {
                    Image("BtnMyAdventures")
                }
                .opacity(showSaved ? 1 : 0.6 )
                .disabled(!showSaved)
                
                Button{
                    dao.cenaAtual = .aiInfo
                }label: {
                    Image("BtnInfo")
                }
                
                Spacer()
                HStack{
                    Button{
                        dao.cenaAtual = .diarySwipe
                    }label: {
                        Image("BtnDiary")
                            .resizable()
                            .frame(width: 80, height: 80)
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
    GenerateAI()
}
