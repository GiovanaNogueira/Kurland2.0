//
//  AiController+aiXplain.swift
//  Kurland
//
//  Created by Giovana Nogueira on 27/06/24.
//

import Foundation
import aiXplainKit

extension AIController{
    func configureAPIKey(){
        AiXplainKit.shared.keyManager.TEAM_API_KEY = "e33d22af7c86308baaeab7d41fb1ce2c62aa418d1f09ce8263137199c65d2c45"
    }
    
    
    func fetchModels() async {
        let modelProvider = ModelProvider()
        
        self.llama3 = try? await modelProvider.get("640b517694bf816d35a59125")
        
    }
}


extension AIController{
    
    func createStory(using entriesList:[String]) async throws -> Story?{
        guard let llama3 = self.llama3 else {
            return nil
        }
        
        var storyAsString: String = ""
        
        for entry in entriesList {
            storyAsString.append(entry)
        }
        
        do {
            let modelOutput = try await llama3.run(["data": storyAsString, "context": LlamaSystemContext, "max_tokens" : 4096.description])
            print("Dados brutos recebidos do modelo: \(modelOutput.output)")
            
            // Verifique se os dados estão no formato JSON esperado
            guard let data = modelOutput.output.data(using: .utf8) else {
                print("Erro ao converter a string recebida em Data.")
                return nil
            }
            
            // Tente validar o JSON recebido
            if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                print("JSON validado com sucesso: \(jsonObject)")
            } else {
                print("JSON recebido está inválido ou incompleto: \(String(describing: String(data: data, encoding: .utf8)))")
                return nil
            }
            
            do {
                let story = try JSONDecoder().decode(Story.self, from: data)
                print("História decodificada com sucesso: \(story)")
                return story
            } catch {
                print("Erro ao decodificar JSON em Story: \(error.localizedDescription)")
                print("Dados recebidos que causaram o erro: \(String(describing: String(data: data, encoding: .utf8)))")
                throw error
            }
            
        } catch {
            print("Erro ao executar modelo AI: \(error.localizedDescription)")
            throw error
        }
    }
}

//MARK: System Promt
let LlamaSystemContext:String = """
         You are an AI assistant designed to generate an enchanting story based on a list of diary entries provided. The story is aimed at kids with curly, coily, or wavy hair, primarily Black kids, with the main goal of helping them build confidence and self-esteem about their unique traits, especially their hair and skin color.
        
         Users will provide a list of entries where each entry is a string. Based on these entries, generate a magical and enchanting story that incorporates only the relevant information about their lives. You can't use the kids name, instead you will tell them their story, just like "You did this", "You went to the castle...". The story must be set in the fictional kingdom of Kurland, which is the main place in our story. You can be creative and set the stories on Kurland's grounds, like a forest, a village, a lake etcetera. Don't use harsh words, bad words, negative words. Try not to use difficult words, after all this is a children book. The story should be returned exclusively in the following JSON format, without additional formatting, where each paragraph of the story is an element in the list of strings:
        
         {
           "title": "Story title",
           "story": ["paragraph 1", "paragraph 2", ... "paragraph n"]
         }
        """

//var entrada: [String : any ModelInput] = ["data" : LlamaSystemContext, "max_tokens" : 4096.description]
