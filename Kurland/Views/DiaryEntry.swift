//
//  DiaryEntry.swift
//  Kurland
//
//  Created by Giovana Nogueira on 20/06/24.
//

import SwiftUI

struct DiaryEntry: View {
    
    var suggestion: String = "Today I felt confident because..."
    @State var entrada: String = ""
    @State var titulo: String = ""
//    @State private var selectedImage: UIImage?
    
    var body: some View {

        VStack{
            
            ZStack{
               
                TextField("Write your title", text: $titulo)
                    .font(.system(size: 50).bold())
                    .multilineTextAlignment(.center)
                    .foregroundColor(.brightPurple)
                    .padding(.top, 30)
                
                HStack{
                    
                    Spacer()
                    Button {
                        var dia: Entry = Entry(id: UUID(), titulo: titulo, corpo: entrada, data: Date())
                        dao.diario.append(dia)
                        dao.cenaAtual = .diarySwipe
                    } label: {
                        Text("Save")
                            .foregroundStyle(.brightPurple)
                            .font(.title.bold())
                    }
                    .padding(.trailing, 40)
                    .padding(.bottom, 40)
                }
            }
            
            ZStack(alignment:.leading){
                
                VStack{
                    TextEditor(text: $entrada)
                        .padding(.leading, 10)
                        .font(.title)
                }
                
                if entrada.isEmpty{
                    VStack{
                        Text(suggestion)
                            .foregroundStyle(.gray)
                            .opacity(0.8)
                            .padding(.top, 8)
                            .padding(.leading, 10)
                            .font(.title.weight(.light))
                        Spacer()
                    }
                }
                
            }
            .padding(.top, 40)

        }
    }
}

#Preview {
    DiaryEntry()
}
