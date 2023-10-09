//
//  HopscotchView.swift
//  gameApp
//
//  Created by Bora Birlikci on 26.07.2023.
//

import SwiftUI
import AVKit

struct HopscotchView: View {
    @State private var showInfo: Bool = false
    @State private var lastBox: Int = 1
    @State private var lastRow: Int = 1
    @State private var row1: String = ""
    @State private var row2: String = ""
    @State private var row3: String = ""
    @State private var row4: String = ""
    @State private var row5: String = ""
    @State private var row6: String = ""
    @State private var endRow: Int = Int.random(in: 2..<7)
    @State private var playerOn: Int = 0
    @State private var stopOn: Int = 0
    @State private var gameStarted: Bool = false
    @State private var showCongrats: Bool = false
    @State private var showFeedback: Int = -1
    @State private var endGoal: Int = -1
    
    
    var body: some View {

        ZStack{
            
            Image("hopscotchBackground")
                .scaledToFit()
            VStack{
                HStack{
                    Spacer()
                    Image("infoButton").padding(.horizontal, 100).padding(.top, 40).onTapGesture {
                        showInfo = !showInfo
                    }
                }
                Spacer()
            }
            
            VStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.white.opacity(0.0))
                HStack{
                    ZStack{
                        RowView(boxName: "", draggable: false, rowID: 0)
                        if(playerOn == 0){
                            Image("hopscotchCharacther").resizable()
                                .frame(width: 160, height: 160)
                                .onAppear{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        
                                    }
                                }
                        }
                    }
                    
                    ZStack{
                        RowView(boxName: row1, draggable: true, rowID: 1)
                            .dropDestination(for: String.self){items,location in
                                if(row1.isEmpty && lastBox != -1){
                                    if(items.first!.contains("Single")){
                                        lastBox += 1
                                        lastRow += 1
                                        self.row1 = items.first!
                                    
                                    }
                                    else if(items.first!.contains("Double")){
                                        lastBox += 2
                                        lastRow += 1
                                        self.row1 = items.first!
                                    }
                                    else{
                                        self.row1 = items.first!
                                        lastBox = -1
                                        
                                        stopOn = 1
                                    }
                                    return true
                                }else{
                                    return false
                                }
                            }
                        
                        if(playerOn == 1){
                            Image("hopscotchCharacther").resizable()
                                .frame(width: 160, height: 160)
                                .onAppear{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        if(playerOn < stopOn){
                                            playerOn = playerOn + 1
                                        }
                                        else{
                                            if(lastRow == endRow){
                                                if(lastBox == endGoal){
                                                    showFeedback = 1
                                                }else{
                                                    showFeedback = 0
                                                }
                                            }
                                            
                                        }
                                    }
                                }
                        }
                    }
                    
                    ZStack{
                        RowView(boxName: row2, draggable: true, rowID: 2)
                            .dropDestination(for: String.self){items,location in
                                if(row2.isEmpty && lastBox != -1){
                                    if(items.first!.contains("Single")){
                                        lastBox += 1
                                        lastRow += 1
                                        self.row2 = items.first!
                                    }
                                    else if(items.first!.contains("Double")){
                                        lastBox += 2
                                        lastRow += 1
                                        self.row2 = items.first!
                                    }
                                    else{
                                        self.row2 = items.first!
                                        lastBox = -1
                                        stopOn = 2
                                    }
                                    return true
                                }else{
                                    return false
                                }
                            }
                        if(playerOn == 2){
                            Image("hopscotchCharacther").resizable()
                                .frame(width: 160, height: 160)
                                .onAppear{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        if(playerOn < stopOn){
                                            playerOn = playerOn + 1
                                        }
                                        else{
                                            if(lastRow == endRow){
                                                if(lastBox == endGoal){
                                                    showFeedback = 1
                                                }else{
                                                    showFeedback = 0
                                                }
                                            }
                                        }
                                    }
                                }
                        }
                    }
                    
                    ZStack{
                        RowView(boxName: row3, draggable: true, rowID: 3)
                            .dropDestination(for: String.self){items,location in
                                if(row3.isEmpty && lastBox != -1){
                                    if(items.first!.contains("Single")){
                                        lastBox += 1
                                        lastRow += 1
                                        self.row3 = items.first!                                }
                                    else if(items.first!.contains("Double")){
                                        lastBox += 2
                                        lastRow += 1
                                        self.row3 = items.first!
                                    }
                                    else{
                                        self.row3 = items.first!
                                        lastBox = -1
                                        stopOn = 3
                                    }
                                    return true
                                }else{
                                    return false
                                }
                            }
                        if(playerOn == 3){
                            Image("hopscotchCharacther").resizable()
                                .frame(width: 160, height: 160)
                                .onAppear{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        if(playerOn < stopOn){
                                            playerOn = playerOn + 1
                                        }
                                        else{
                                            if(lastRow == endRow){
                                                if(lastBox == endGoal){
                                                    showFeedback = 1
                                                }else{
                                                    showFeedback = 0
                                                }
                                            }
                                        }
                                    }
                                }
                        }
                    }
                    
                    ZStack{
                        RowView(boxName: row4, draggable: true, rowID: 4)
                            .dropDestination(for: String.self){items,location in
                                if(row4.isEmpty && lastBox != -1){
                                    if(items.first!.contains("Single")){
                                        lastBox += 1
                                        lastRow += 1
                                        self.row4 = items.first!
                                    }
                                    else if(items.first!.contains("Double")){
                                        lastBox += 2
                                        lastRow += 1
                                        self.row4 = items.first!
                                    }
                                    else{
                                        self.row4 = items.first!
                                        lastBox = -1
                                        stopOn = 4
                                    }
                                    return true
                                }else{
                                    return false
                                }
                            }
                        if(playerOn == 4){
                            Image("hopscotchCharacther").resizable()
                                .frame(width: 160, height: 160)
                                .onAppear{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        if(playerOn < stopOn){
                                            playerOn = playerOn + 1
                                        }
                                        else{
                                            if(lastRow == endRow){
                                                if(lastBox == endGoal){
                                                    showFeedback = 1
                                                }else{
                                                    showFeedback = 0
                                                }
                                            }
                                        }
                                    }
                                }
                        }
                    }
                    
                    ZStack{
                        RowView(boxName: row5, draggable: true, rowID: 5)
                            .dropDestination(for: String.self){items,location in
                                if(row5.isEmpty && lastBox != -1){
                                    if(items.first!.contains("Single")){
                                        lastBox += 1
                                        lastRow += 1
                                        self.row5 = items.first!
                                    }
                                    else if(items.first!.contains("Double")){
                                        lastBox += 2
                                        lastRow += 1
                                        self.row5 = items.first!
                                    }
                                    else{
                                        self.row5 = items.first!
                                        lastBox = -1
                                        stopOn = 5
                                    }
                                    return true
                                }else{
                                    return false
                                }
                            }
                        if(playerOn == 5){
                            Image("hopscotchCharacther").resizable()
                                .frame(width: 160, height: 160)
                                .onAppear{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        if(playerOn < stopOn){
                                            playerOn = playerOn + 1
                                        }
                                        else{
                                            if(lastRow == endRow){
                                                if(lastBox == endGoal){
                                                    showFeedback = 1
                                                }else{
                                                    showFeedback = 0
                                                }
                                            }
                                        }
                                        
                                    }
                                }
                        }
                    }
                    
                    ZStack{
                        RowView(boxName: row6, draggable: true, rowID: 6)
                            .dropDestination(for: String.self){items,location in
                                if(row6.isEmpty && lastBox != -1){
                                    if(items.first!.contains("Single")){
                                        lastBox += 1
                                        lastRow += 1
                                        self.row6 = items.first!
                                    }
                                    else if(items.first!.contains("Double")){
                                        lastBox += 2
                                        lastRow += 1
                                        self.row6 = items.first!
                                    }
                                    else{
                                        self.row6 = items.first!
                                        lastBox = -1
                                        stopOn = 6
                                    }
                                    return true
                                }else{
                                    return false
                                }
                            }
                        if(playerOn == 6){
                            Image("hopscotchCharacther").resizable()
                                .frame(width: 160, height: 160)
                                .onAppear{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        if(lastRow == endRow){
                                            if(lastBox == endGoal){
                                                showFeedback = 1
                                            }else{
                                                showFeedback = 0
                                            }
                                        }
                                    }
                                }
                        }
                    }
                    
                }.padding(.bottom, 70)
                
            }
            
            VStack{
                Spacer()
                HStack{
                    Image("boxSingleEmpty")
                        .resizable()
                        .scaledToFit()
                        .padding(12)
                        .draggable("boxSingle\(lastBox)")
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white.opacity(0.7)))
                    Image("boxDoubleEmpty")
                        .resizable()
                        .scaledToFit()
                        .padding(12)
                        .draggable("boxDouble\(lastBox)")
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white.opacity(0.7)))
                    Image("boxEndEmpty")
                        .resizable()
                        .scaledToFit()
                        .padding(12)
                        .onTapGesture(perform: {
                            endGoal = Int.random(in: endRow..<(endRow*2))
                            if(endRow == 1){
                                row1 = "boxEnd\(endGoal)"
                                stopOn = 1
                            }
                            else if(endRow == 2){
                                stopOn = 2
                                row2 = "boxEnd\(endGoal)"
                            }
                            else if(endRow == 3){
                                row3 = "boxEnd\(endGoal)"
                                stopOn = 3
                            }
                            else if(endRow == 4){
                                row4 = "boxEnd\(endGoal)"
                                stopOn = 4
                            }
                            else if(endRow == 5){
                                row5 = "boxEnd\(endGoal)"
                                stopOn = 5
                            }
                            else if(endRow == 6){
                                row6 = "boxEnd\(endGoal)"
                                stopOn = 6
                            }
                        })                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white.opacity(0.7)))
                    Image("restartIcon")
                        .scaledToFit()
                        .padding(12)
                        .onTapGesture {
                            row1 = ""
                            row2 = ""
                            row3 = ""
                            row4 = ""
                            row5 = ""
                            row6 = ""
                            lastBox = 1
                            lastRow = 1
                        }
                    Image("playIcon")
                        .scaledToFit()
                        .padding(12)
                        .onTapGesture {
                            playerOn = 1
                        }
                    
                }.padding(.horizontal, 300)
            }
            
            if(showFeedback == 1){
                FeedbackView(isSuccess: true, message: "Kamu berhasil!")
            }else if(showFeedback == 0){
                if(lastBox > endGoal){
                    FeedbackView(isSuccess: false, message: "Kurangi kotaknya!")
                }else{
                    FeedbackView(isSuccess: false, message: "Tambahkan kotaknya!")
                }
            }
            if(showInfo){
                Text("test").font(.title)
                VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "tutorialv3", withExtension: "mp4")!)).frame(width: 600, height: 300, alignment: .center).padding()
                    .background(Rectangle().foregroundColor(.white).cornerRadius(15).shadow(radius: 15))
              }
        }
      
    }
}

struct RowView: View{
    let boxName: String
    let draggable: Bool
    let rowID: Int
    
    var body: some View{

        if (!draggable){
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.black.opacity(0.0))
                .padding(12)
                .frame(width: 100, height: 300)
        }
        else if (boxName != ""){
            ZStack{

                if(boxName.contains("Single")){
                    Image(boxName)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .rotationEffect(.degrees(90))
                        .background( RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.black.opacity(0.02))
                            .padding(6)
                            .frame(width: 100, height: 250))
                }
                else{
                    Image(boxName)
                        .resizable()
                        .frame(width: 120, height: 60)
                        .rotationEffect(.degrees(90))
                        .background( RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(.black.opacity(0.02))
                            .padding(6)
                            .frame(width: 100, height: 250))
                }
                
                
            }
        }
        else{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.black.opacity(0.05))
                .padding(6)
                .frame(width: 100, height: 250)
        }
        
    }
}

struct FeedbackView: View{
    let isSuccess: Bool
    let message: String
    
    var body: some View{
        VStack{
            Text(message).font(.title).padding(.horizontal)
            if(isSuccess){
                Image("successIcon").resizable().scaledToFit()
                //Add okay button
            }else{
                Image("failIcon").resizable().scaledToFit()
                //Add try again button
            }
            
            
        }.background(RoundedRectangle(cornerRadius: 15).foregroundColor(.teal.opacity(0.75))).padding(40)
    }
}

struct HopscotchView_Previews: PreviewProvider {
    static var previews: some View {
        HopscotchView()
    }
}

