//
//  AIController.swift
//  Kurland
//
//  Created by Giovana Nogueira on 26/06/24.
//

import Foundation
import aiXplainKit

final class AIController: ObservableObject {
    @Published var appState: Cena = .diaryEntry
    var llama3: Model? = nil
    
    init(){
        setupAiXplain()
    }
    
    private func setupAiXplain(){
        Task{
            configureAPIKey()
            await fetchModels()
        }
    }
    
    @MainActor
    func makeStory(using entriesList: [String]) async throws{
        dao.cenaAtual = .processing
        
        guard let story = try await createStory(using: entriesList) else{
            self.appState = .diaryEntry
            return
        }
        
        dao.story = story
        dao.entryList.removeAll()
        dao.cenaAtual = .showingStory
//        print("\(story)")
        self.appState = .showingStory
    }
}
