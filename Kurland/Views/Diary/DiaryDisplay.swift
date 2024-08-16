//
//  DiaryDisplay.swift
//  Kurland
//
//  Created by Giovana Nogueira on 26/06/24.
//

import SwiftUI

struct DiaryDisplay: View {
    
    let entry = dao.diario.first { $0.id == dao.idEntry }
    @State private var isActive = true
    @State private var showConfirmation = false
    
    
    var body: some View {
        if isActive, let entry = entry {
            ZStack{
                Image("FundoRoxo")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    HStack(alignment: .top){
                        if let imageData = entry.img, let image = stringToImage(imageData) {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(radius: 2)
                                .frame(width: 402, height: 464)
                        }
                        ScrollView(showsIndicators: false){
                            VStack(alignment: .leading){
                                Text(entry.titulo.uppercased())
                                    .font(.custom("PatrickHand-Regular", size: 60))
                                Text(entry.corpo)
                                    .font(.custom("PatrickHand-Regular", size: 40))
                                    .padding(.bottom, 30)
                                
                                Text(formatDates(from: entry.data).abbreviatedFormat)
                                    .font(.custom("PatrickHand-Regular", size: 28))
                                    .opacity(0.8)
                                
                            }
                            .padding(50)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
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
                        
                        HStack(alignment: .center, spacing: 30){
                            Button{
                                showConfirmation = true
                                
                            }label: {
                                Text("Delete")
                                    .font(.title2.weight(.medium))
                                    .foregroundStyle(Color.white)
                                    .padding(.bottom, 20)
                            }
                            .alert(isPresented: $showConfirmation){
                                Alert(title: Text("Delete Entry"),
                                      message: Text("Are you sure you want to delete this entry? This action cannot be undone."),
                                      primaryButton: .destructive(Text("Delete"), action: {
                                    withAnimation {
                                        isActive = false
                                    }
                                    dao.removeEntry(by: dao.idEntry!)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                        dao.cenaAtual = .diarySwipe
                                    }
                                }),
                                      secondaryButton: .cancel())
                            }
                            Button{
                                dao.isEditing = true
                                dao.cenaAtual = .diaryEntry
                            }label: {
                                Image("BtnEdit")
                                    
                            }
                            .padding(.bottom, 20)
                            .padding(.trailing, 50)
                        }
                    }
                }
            }
            .transition(.opacity)
            .animation(.default, value: isActive)
        }
    }
}

#Preview {
    DiaryDisplay()
}
