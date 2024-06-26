//
//  DiaryEntry.swift
//  Kurland
//
//  Created by Giovana Nogueira on 20/06/24.
//

import SwiftUI
import Combine

struct DiaryEntry: View {
    
    var suggestion: String = "Today I felt confident because..."
    @State var entrada: String = ""
    @State var titulo: String = ""
    @State var showCamera: Bool = false
    @State var image: UIImage?
    let textLimit = 15
    
    let entry = dao.diario.first { $0.id == dao.idEntry }
    
    var body: some View {

        VStack{
            
            ZStack{
               
                TextField("Write your title", text: $titulo)
                    .font(.system(size: 50).bold())
                    .multilineTextAlignment(.center)
                    .foregroundColor(.brightPurple)
                    .padding(.top, 30)
                    .onReceive(Just(titulo)){ _ in limitText(textLimit)}
                
                HStack{
                    Button{
                        dao.cenaAtual = .diarySwipe
                    }label: {
                        Text("Cancel")
                            .foregroundStyle(.brightPurple)
                            .font(.title.bold())
                    }
                    .padding(.leading, 40)
                    Spacer()
                    Button{
                        showCamera = true
                    }label: {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .foregroundColor(.brightPurple)
                            .frame(width: 30, height: 25)
                    }
                    .padding(.trailing, 50)
                    
                    Button {
                      saveEntry()
                    } label: {
                        Text("Save")
                           
                    }
                    .foregroundStyle(entrada.isEmpty ? .brightPurple.opacity(0.4) : .brightPurple)
                    .font(.title.bold())
                    .padding(.trailing, 40)
                    .disabled(entrada.isEmpty)
                }
                .padding(.bottom, 40)
            }
            HStack(alignment: .top){
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 2)
                        .padding(.leading, 20)
                    
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
                .padding(.leading, 20)
            }
            .padding(.top, 40)
        }
        .onAppear{
            if dao.isEditing, let currentEntry = dao.diario.first(where: { $0.id == dao.idEntry }) {
                entrada = currentEntry.corpo
                titulo = currentEntry.titulo
                if let imageData = currentEntry.img, !imageData.isEmpty{
                    image = stringToImage(imageData)
                }else{
                    image = nil
                }
            }
        }
        .sheet(isPresented: $showCamera, content: {
            CameraView(selectedImage: $image)
        })
    }
    
    func saveEntry() {
        if dao.isEditing, let index = dao.diario.firstIndex(where: { $0.id == dao.idEntry}) {
                dao.diario[index].titulo = titulo
                dao.diario[index].corpo = entrada
                dao.diario[index].img = imageToString(image)
                dao.isEditing = false
            }
        else{
            let dia: Entry = Entry(id: UUID(), titulo: titulo, img: imageToString(image), corpo: entrada, data: Date())
            dao.diario.append(dia)
            
        }
        dao.cenaAtual = .diarySwipe
    }
    
    func limitText(_ upper: Int) {
           if titulo.count > upper {
               titulo = String(titulo.prefix(upper))
           }
       }

}

#Preview {
    DiaryEntry()
}

