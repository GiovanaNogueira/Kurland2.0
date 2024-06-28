//
//  LaunchScreen.swift
//  Kurland
//
//  Created by Giovana Nogueira on 27/06/24.
//

import Foundation
import SwiftUI

struct LaunchScreenView: View {
    @State var contador = 1
    @State var goToNextView = false
    @State var animaTrigger = false
    
    let animacao:[String] = ["one", "two", "three", "four"]
    
    var body: some View {
//        ZStack{
//            NavigationStack {
                
                ZStack{
                    Image("FundoRoxoDuplo")
                        .resizable()
                        .ignoresSafeArea(.all)
//                    if goToNextView == false {
                        ZStack{
                            Image("K")
                                .resizable()
                                .scaledToFit()
                                .frame(height: animaTrigger ? 150 : 1)
                          Spacer()
//                            VStack{
//                                Spacer()
//
//                                HStack{
//                               
//                                    Image("K")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 155 ,height: animaTrigger ? 100 : 1)
//                                
//                                }
//                                
//                            }
//                            if !animaTrigger {
//                                Spacer()
//                            }
                        }
//                    } else {
//                        ContentView()
//                    }

                }
                .animation(.default, value: goToNextView)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5)
            {
                animaTrigger.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5)
                {
                    dao.cenaAtual = .abertura
                }
            }
            
        }
        .animation(.smooth(duration: 0.5), value: animaTrigger)
    }
        
}

#Preview {
    LaunchScreenView()
}
