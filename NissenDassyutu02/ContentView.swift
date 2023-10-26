//
//  ContentView.swift
//  NissenApp02
//
//  Created by cmStudent on 2023/10/05.
//

import SwiftUI
import AVFoundation

struct Sound{
    let aVAudioPlayer : AVAudioPlayer
    var volume : Float
    init(_ name:String, _ volume:Float){
        self.aVAudioPlayer = try! AVAudioPlayer(data: NSDataAsset(name: name)!.data)
        self.volume = volume
    }
    func play(){
        aVAudioPlayer.stop()
        aVAudioPlayer.currentTime = 0.0
        aVAudioPlayer.play()
        aVAudioPlayer.volume = volume

    }
    func stop(){
        aVAudioPlayer.stop()
    }
    
    func playLoop(){
        aVAudioPlayer.numberOfLoops = -1
        aVAudioPlayer.play()
    }
}

var sousinSound = Sound("送信音", 2)//
var hakaiSound = Sound("破壊音_たくさん破壊", 5)//
var bgmSound = Sound("song02", 0.2)//
var ButtonCloseSound = Sound("todo発生音声", 2)//
var ButtonOpenSound = Sound("todoクリア音声", 2)//
var ninsyouOkSound = Sound("認証成功音声", 2)//
var ninsyouNoSound = Sound("認証エラー音声", 2)//
//成功してるけどtodoIndexが追いついてない時、
var ninsyouButtonSound = Sound("認証のボタン押す音", 2)



func debugFunc(){
    todoTextIndex += 1
    print(todoTextIndex)
    if todoTextIndex == 15 {
        todoTextIndex = 0
    }
}
//todoリスト
let toDoText = [
                "0-1Mが入力中...",
                "1-2todo:ケーブルを指してみる",
                "2-3Mが入力中",
                "3-4todo:ターミナルアプリを確認する",
                "4-5Mが入力中",
                "5-6todo:パスワードを解読し、認証する",
                "6-7Mが入力中...",
                "7-8todo:781教室のカメラを見る",
                "8-9Mが入力中...",
                "9-10Todo:1fのカメラを見てSさんが来るのを待つ",
                "10番クリア！！！！"
                
                
                ]
 var todoTextIndex = 0

//次の会話に移れないようにする
 var closeNextText = false
//次の会話を閉鎖する
func ButtonClose() {
    ButtonCloseSound.play()
    closeNextText = true
    todoTextIndex += 1
    print(todoTextIndex)
    
    if todoTextIndex == 10{
        //ゲームクリア
    }
}
//次の会話を開放する
func ButtonOpen() {
    ButtonOpenSound.play()
    closeNextText = false
    todoTextIndex += 1
    print(todoTextIndex)
}
//ボタンを押した数
 var ButtonCount = 0

//会話ボタン
func ButtonCountUp(){
    sousinSound.play()
    ButtonCount += 1
    print("ボタンカウント\(ButtonCount)")
    //ユーザー操作が始まる時Closeする
    switch ButtonCount {
    case 14,17,19,21,26 ://closeするタイミング
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.000000000000000000000001){
            ButtonClose()
        }
    case 3:
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            hakaiSound.play()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            bgmSound.playLoop()
        }
        break
    default:
        break
    }
}


struct ContentView: View {
    
    @StateObject var messageVM = MessageAppViewModel()
    @StateObject var terminalVM = TerminalAppViewModel()
    @StateObject var model = Model()

 

    
    
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("ダウンロード")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    HStack{
                        VStack{
                            ZStack{
                                
                                Button {
                                    messageVM.messageAppOpenClose()
                                    print(messageVM.isShowMessage)
                                } label: {
                                    icon(color: .green, iconImageTitle: "message.fill")
                                }.fullScreenCover(isPresented: $messageVM.isShowMessage) {
                                    MessageAppView0(messageVM: messageVM, model: model)
                                }
                               
                                if messageVM.newMessage{//通知のView
                                    newMessage(newMessageCount: messageVM.newMessageCount).offset(x: 40,y:-40)
                                }
                                    
                                  
                            }
                            Text("メッセージ")
                                .frame(width: 80)
                                .font(.caption)
                                .foregroundColor(.white)
                            
                        }
                        VStack{
                            Button {
                                terminalVM.terminalAppOpenClose()
                            } label: {
                                icon(color: .black, iconImageTitle: "terminal")
                            }.fullScreenCover(isPresented: $terminalVM.isShowTerminal) {
                                TerminalAppView(terminalVM: terminalVM ,model: model)
                            }
                            Text("ターミナル")
                                .frame(width: 80)
                                .font(.caption)
                                .foregroundColor(.white)
                        }
//                        VStack{
//                            Button(action:debugFunc) {
//                                icon(color: .red, iconImageTitle: "camera.metering.center.weighted")
//                            }
//                            Text("デバッグカメラ")
//                                .frame(width: 80)
//                                .font(.caption)
//                                .foregroundColor(.white)
//                        }
                        VStack{
                            icon(color: .black.opacity(0.0001), iconImageTitle: "")
                            Text("")
                                .frame(width: 80)
                                .font(.caption)
                        }
                    }  .padding()
                    Spacer()
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

struct icon : View {
    var color : Color
    var iconImageTitle : String
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(color)
                    .frame(width:80,height: 80)
                Image(systemName: iconImageTitle)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .foregroundColor(.white)
            }
        }
    }
}


struct newMessage : View{
    var newMessageCount : Int
    var body : some  View{
        ZStack{
            Text("\(newMessageCount)")
                .foregroundColor(.white)
                .background {
                    Circle()
                        .foregroundColor(.red)
                        .frame(width: 25, height: 25)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        icon(color: .green, iconImageTitle: "message.fill")
        ContentView()
//        topbar(TimeText: "20:30")
//        newMessage()
    }
}
