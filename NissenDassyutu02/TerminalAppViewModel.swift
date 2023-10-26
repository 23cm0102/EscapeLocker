//
//  TerminalAppViewModel.swift
//  NissenApp02
//
//  Created by cmStudent on 2023/10/09.
//

import SwiftUI
import AVKit
//ビデオのView
struct VideoPlayerView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "IMG_3592 2", withExtension: "mov")!)) {
        }
    }
}
//1fのカメラ映像
struct VideoPlayerView1f: View {
    var isShowNewText = false
    var body: some View {
        ZStack{
            VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "IMG_1Fcam02", withExtension: "mov")!)) {
            }
        }
    }
}



class TerminalAppViewModel : ObservableObject, Identifiable{

    @Published var isShowVideoPlaySheet = false
    
    @Published var terminalID = UUID()
    @Published var commandText = ["接続を検知しました。",
                                  "name:教員用データベース",
                                  "画面タップで認証を開始します",]
    //パスビューの表示
    @Published var isShowPassView = false
    //ターミナルの表示
    @Published var isShowTerminal = false
    
    //ターミナルの表示,非表示
    func terminalAppOpenClose(){
        isShowTerminal.toggle()
    }
    
    @Published var passText = ""
    @Published var toDoText = "4桁のパスワードを入力してください"
    @Published var passViewColor : Color = .green
    @Published var isLogin = false
    func passJudje(){
        
        if passText == "9532" && todoTextIndex == 5{
            ButtonOpen()
            toDoText = "認証成功"
            ninsyouOkSound.play()
            passViewColor = .blue
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                self.isShowPassView = false
            }
            self.commandText.append("student@iPhone ~ % pass 1229")
            self.commandText.append("認証中")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                self.commandText.append("認証に成功しました")
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                    self.commandText.append("---ようこそ\"23CM.Teacher\"---")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                        self.commandText.append("あなたがアクセスできるデータは以下の通りです")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                            self.commandText.append("監視カメラデータ")
                            self.commandText.append("閲覧したいカメラのパスワードを入力してください")
                            self.commandText.append("画面タップで入力開始します")
                            self.passViewColor = .green
                            self.toDoText = "カメラの6桁のパスワードを入力してください"
                            self.passReset()
                            self.isLogin = true
                        }
                    }
                }
            }
        } else if passText == "9532" && todoTextIndex != 5{
            passViewColor = .gray
            toDoText = "番号は合ってるみたいだけどMくんに報告しとこう"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.isShowPassView = false
                self.toDoText = "4桁のパスワードを入力してください"
                self.passReset()
                self.passViewColor = .green
            }
        }else{
            self.passViewColor = .red
            self.toDoText = "認証失敗"
            
            ninsyouNoSound.play()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                self.passViewColor = .green
                self.toDoText = "4桁のパスワードを入力してください"
                self.passReset()
            }
        }
    }
    func passReset(){
        passText = ""
    }
    
    func dataOpen(){
        
        guard let num = Int(passText) else{
            return
        }
        
        switch num{
//        case 1 :
//            toDoText = "生徒名簿を開きます"
//            passViewColor = .blue
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
//                self.isShowPassView = false
//            }
//            self.commandText.append("student@iPhone ~ % 1")
//            self.commandText.append("---------------生徒名簿------------------")
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
//                self.commandText.append("23cm0101:赤石ひなた")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
//                    self.commandText.append("23cm0102:荒瀬こうたろう")
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
//                        self.commandText.append("23cm0103:江原まゆ")
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//                            self.commandText.append("----------------------------------------")
//                            self.commandText.append("1.生徒名簿")
//                            self.commandText.append("2.カメラデータ")
//                            self.commandText.append("3.成績表")
//                            self.commandText.append("開きたい場合は番号を入力してください")
//                            self.commandText.append("example...生徒名簿なら1番を入力")
//                            self.passViewColor = .green
//                            self.toDoText = "データを選択してください"
//                            self.passReset()
//
//                        }
//                    }
//                }
//            }
        case 712781 :
            if todoTextIndex == 9{//9の時ストーリー進む
                isShowVideoPlaySheet = true
                passViewColor = .blue
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                    self.isShowPassView = false
                    self.passViewColor = .green
                    self.toDoText = "カメラの6桁のパスワードを入力してください"
                    ButtonOpen()
                }
            }else{
                passViewColor = .gray
                toDoText = "一旦メッセージでMくんに報告してからにしよう"
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    self.isShowPassView = false
                    self.toDoText = "カメラの6桁のパスワードを入力してください"
                    self.passReset()
                    self.passViewColor = .green
                }
            }
        case 751731 ://781監視カメラ再生
            if todoTextIndex == 7{//7の時ストーリー進む
                isShowVideoPlaySheet = true
                passViewColor = .blue
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                    self.isShowPassView = false
                    self.passViewColor = .green
                    self.toDoText = "カメラの6桁のパスワードを入力してください"
                    ButtonOpen()
                }
            }else{
                    passViewColor = .gray
                    toDoText = "一旦メッセージでMくんに報告してからにしよう"
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        self.isShowPassView = false
                        self.toDoText = "カメラの6桁のパスワードを入力してください"
                        self.passReset()
                        self.passViewColor = .green
                    }
                
            }
//        case 11 ://1fの監視カメラ再生
//            if todoTextIndex == 9{//9の時ストーリー進む
//            isShowVideoPlaySheet = true
//            passViewColor = .blue
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
//                    self.isShowPassView = false
//                    self.passViewColor = .green
//                    self.toDoText = "データを選択してください"
//                    ButtonOpen()
//                }
//
//            }
        default:
            passReset()
            self.passViewColor = .red
            self.toDoText = "パスワードが間違っています  "
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                self.passViewColor = .green
                self.toDoText = "カメラの6桁のパスワードを入力してください"
                self.passReset()
            }
        }
    }
}
