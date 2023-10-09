//
//  MenuView.swift
//  gameApp
//
//  Created by Bora Birlikci on 26.07.2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        
        NavigationView{
        
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 20.0){
                    Image("gasingThumbnail").resizable().aspectRatio( contentMode: .fit).cornerRadius(15)
                    
                    Text("Gasing")
                        .font(.headline)
                        .fontWeight(.bold)
                    HStack {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                        
                        Spacer()
                        
                        
                        NavigationLink("Play Game"
                                       , destination: GasingView())
                        .navigationTitle("Gasing Game")
                        //.navigationBarHidden(true)
                        
                    }
                    
                    
                    
                }.padding()
                    .background(Rectangle().foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 15))
                    .padding()
                
                VStack(alignment: .leading, spacing: 20.0){
                    Image("hopScotchThumbnail").resizable().aspectRatio( contentMode: .fit).cornerRadius(15)
                    
                    Text("Dambu Bulan")
                        .font(.headline)
                        .fontWeight(.bold)
                    HStack {
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                        
                        Spacer()
                        
                        
                        NavigationLink("Play Game"
                                       , destination: HopscotchView())
                        .navigationTitle("Dambu Bulan Game")
                        .navigationBarHidden(true)
                        
                    }
                    
                    
                    
                }.padding()
                    .background(Rectangle().foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 15))
                    .padding()
                
                
                
            }
        }
    }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
