//
//  GasingPlayView.swift
//  gameApp
//
//  Created by Bora Birlikci on 26.07.2023.
//

import SwiftUI
import WebKit
import Foundation

struct GasingPlayView: View {
    var height : Int
    var speed : Int
    var mass : Int
    var radius : Int
    
    @State private var showLeftGif = false
    @State private var showRightGif = false
    @State private var showBeginning = true
    @State private var leftDropped = false
    @State private var rightDropped = false
    @State private var leftDuration = 0
    @State private var rightDuration = 0
    
    @State private var rightMass = 0
    @State private var rightHeight = 0
    @State private var rightRadius = 0
    
    
    var body: some View {
        ZStack{
            if (self.showBeginning) {
                VStack{
                    GifImage("giphy")
                        .scaledToFit()
                        .frame(maxHeight: 150)
                }.onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                        self.showBeginning = false
                        self.showLeftGif = true
                        self.showRightGif = true
                        calculateDuration()
                    }
                }
            }
            else{
                ZStack{
                    VStack {
                        HStack {
                            // Left side of the screen
                            VStack {
                                if(!(leftDropped && rightDropped)){
                                    Text("Kamu")
                                        .font(.title)
                                        .padding().background(RoundedRectangle(cornerRadius: 15).foregroundColor(.teal))
                                }
                                
                                if showLeftGif {
                                    GifImage("spinning")
                                        .scaledToFit()
                                        .frame(maxHeight: 200)
                                        .onAppear{
                                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(leftDuration)) {
                                                self.showLeftGif = false
                                            }
                                        }
                                } else if (!leftDropped) {
                                    
                                    GifImage("dropping-revised")
                                        .scaledToFit()
                                        .frame(maxHeight: 200)
                                        .onAppear{
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                                self.leftDropped = true
                                            }
                                        }
                                    
                                }
                                else{
                                    Image("dropped").resizable().scaledToFit().frame(maxHeight: 200)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            
                            // Right side of the screen
                            VStack {
                                if(!(leftDropped && rightDropped)){
                                    Text("Lawan")
                                        .font(.title)
                                        .padding().background(RoundedRectangle(cornerRadius: 15).foregroundColor(.teal))
                                }
                                if showRightGif {
                                    GifImage("spinning")
                                        .scaledToFit()
                                        .frame(maxHeight: 200)
                                        .onAppear{
                                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(rightDuration)) {
                                                self.showRightGif = false
                                            }
                                        }
                                } else if (!rightDropped){
                                    
                                    GifImage("dropping-revised")
                                        .scaledToFit()
                                        .frame(maxHeight: 200)
                                        .onAppear{
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                                self.rightDropped = true
                                            }
                                        }
                                    
                                }
                                else{
                                    Image("dropped").resizable().scaledToFit().frame(maxHeight: 200)
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    
                    if(leftDropped && rightDropped){
                        if(leftDuration > rightDuration){
                            FeedbackView(isSuccess: true, message: "Selamat!! Kamu berhasil!")
                        }else{
                            FeedbackView(isSuccess: false, message: "Coba lagi dengan nilai yang berbeda")
                        }
                        
                    }
                    else{
                        
                    }
                    
                }
                
            }
            
        }.background(Image("gasingPlayViewBG").scaledToFit())
       
    }
    
    enum Side {
        case left, right
    }
    
    private func startBeginningTimer() {
        let interval = 4.0 // Replace with your desired time interval in seconds
        Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
            showBeginning = false
        }
            
        
    }
    
    private func stopBeginningTimer() {
        showBeginning = false
    }
    
    private func startLeftTimer(for side: Side) {
        let interval = 5.0 // Replace with your desired time interval in seconds
        
        switch side {
        case .left:
            Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
                showLeftGif = true
            }
        case .right:
            Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
                showRightGif = true
            }
        }
    }
    
    private func stopLeftTimer(for side: Side) {
        switch side {
        case .left:
            showLeftGif = false
        case .right:
            showRightGif = false
        }
    }
    
    private func startTimer(for side: Side) {
        let interval = 5.0 // Replace with your desired time interval in seconds
        
        switch side {
        case .left:
            Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
                showLeftGif = true
            }
        case .right:
            Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
                showRightGif = true
            }
        }
    }
    
    private func stopTimer(for side: Side) {
        switch side {
        case .left:
            showLeftGif = false
        case .right:
            showRightGif = false
        }
    }
    private func calculateDuration(){
        self.rightMass = 2
        self.rightHeight = Int.random(in: 1...3)
        self.rightRadius = Int.random(in: 3...4)
        
        self.leftDuration = Int(sqrt(Double(10 - pow(Double(height - 2), Double(2)))) * (5 - pow(Double(mass - 3), Double(2))) * sqrt(Double(radius)))
        
        self.rightDuration = Int(sqrt(Double(10 - pow(Double(rightHeight - 2), Double(2)))) * (5 - pow(Double(rightMass - 3), Double(2))) * sqrt(Double(rightRadius)))
        
    }
}


struct GasingPlayView_Previews: PreviewProvider {
    static var previews: some View {
        GasingPlayView(height: 5,speed: 5,mass: 5, radius: 5)
        //GasingPlayView()
    }
}

