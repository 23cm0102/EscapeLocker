//
//  MessageAppViewModel.swift
//  NissenApp02
//
//  Created by cmStudent on 2023/10/08.
//

import SwiftUI
import UIKit
import Combine


class MessageAppViewModel : ObservableObject {
    @Published var isShowChoise = false
    @Published var isChoise = false
    @Published var isShowClearView = false
    @Published var isShowAleatView = false
    
    struct MessageBox : View , Identifiable{
        var id = UUID()
        var text : String
        var textColor : Color
        var boxColor : Color
        var marginLeft : CGFloat
        var marginRight : CGFloat
        @State private var adjustedHeight: CGFloat = 0 // テキストの高さに合わせた調整後の高さ
        @State private var adjustedWidth: CGFloat = 0 // バックグラウンドの幅を調整
        
        var body : some View {
            HStack{
                Rectangle()
                    .frame(width: marginLeft, height: 10)
                    .foregroundColor(.clear)
                ZStack {
                    Text(text)
                        .fontWeight(.semibold)
                        .foregroundColor(textColor)
                        .font(.caption)
                        .lineLimit(nil)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 30)
                                .frame(maxWidth: adjustedWidth, maxHeight: adjustedHeight)
                                .foregroundColor(boxColor)
                        )
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .preference(
                                        key: TextSizePreferenceKey.self,
                                        value: geo.size
                                    )
                            }
                        )
                        .onPreferenceChange(TextSizePreferenceKey.self) { textSize in
                            // テキストの高さに合わせてバックグラウンドの高さを調整
                            // ここでは最小の高さを設定していますが、必要に応じて他の方法で調整できます
                            adjustedHeight = max(textSize.height, .infinity)
                            
                            // バックグラウンドの幅を調整
                            adjustedWidth = max(textSize.width, .infinity)
                        }
                }
                .frame(width: adjustedWidth, height: adjustedHeight) // 調整後の高さと幅を適用
                
                Rectangle()
                    .frame(width: marginRight, height: 10)
                    .foregroundColor(.clear)
            }
        }
    }
    @Published var textData = [MessageBox(text: "あのMくん...",textColor:.white,boxColor: .blue,marginLeft: .infinity, marginRight: CGFloat(0)),
                           MessageBox(text: "どうした？",textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity),]
    @Published var text = ""
    @Published var messageListFrame : CGFloat = 500
    private var cancellables: Set<AnyCancellable> = []
    
    var isCharging: Bool {
        return UIDevice.current.batteryState == .charging
    }
    
//    init() {
//        UIDevice.current.isBatteryMonitoringEnabled = true
//        NotificationCenter.Publisher(center: .default, name: UIDevice.batteryStateDidChangeNotification, object: nil)
//            .sink { notification in
//
//                switch UIDevice.current.batteryState {
//
//                    //わかんない
//                case .unknown:
//                    self.hoge = "接続を検知できない"
//                    //充電してない
//                case .unplugged:
//                    self.hoge = "接続を検知できない"
//                    //充電中
//                case .charging:
//                    self.hoge = "接続を検知"
//                    //マックス
//                case .full:
//                    self.hoge = "接続を検知"
//                @unknown default:
//                    break
//                }
//                if self.isCharging {
//                    print("充電中")
//                    self.hoge = "充電中"
//                } else {
//                    print("充電していない")
//                    self.hoge = "充電していない"
//                }
//            }
//            .store(in: &cancellables)
//    }
//
    
    //通知を表示するかしないか
    @Published var newMessage = true
    @Published var newMessageCount = 2
    
    //通知を追加
    func newMessageAppend(count:Int){
        newMessage = true
        newMessageCount = count
    }
    
    //通知をリセット
    func newMessageDelete(){
        newMessage = false
        newMessageCount = 0
    }
    
    //MessageAppの表示
    @Published var isShowMessage = false
    
    //MessageAppの表示,非表示
    func messageAppOpenClose(){
        isShowMessage.toggle()
        newMessage = false
        print(isShowMessage)
    }
   

    
    //追加されるテキストデータ
    let nextTextData = ["やばい、",
                        "ロッカーに隠れてたら先生に鍵閉められちゃった",
                        "鍵は盲点だったわ",
                        "え、",
                        "今なんか音したんだけど",
                        "机が倒れるみたいな音",
                        "普通だれもいないはずだよね",
                        "いや、夜勤の先生が出していい音じゃなかった",
                        "絶対何かいる",
                        "どうやって見るの？",
                        "それが、なんか閉館時刻過ぎたら繋がらなくなっちゃった",
                        "先生の私物とコンセントしかないし、、",
                        "しかもなんかLANケーブルっぽいものがコンセントから生えてる",
                        "よくわかんないけど、iPhoneの充電ケーブルっぽいものがある",
                        "よし",
                        "なんか出てきたよ",
                        "認証が必要だって",
                        "見てきた",
                        "パスワードで認証できるみたい、",
                        "あいたよ！",
                        "これでカメラ見れそう",
                        "まってなんかいたんだけど",
                        "狼の被りもの、、？なんか霊的ななにかがいた、、やばい、、",
                        "待ってガチで助けに来て絶対やばい",
                        "おねがい！！そんなこと言ってる場合じゃない！！！",
                        "Sさんって誰？",
                        "７８１前はまずい！",
                        "もしかして知らされてない、、？",
                        "テスト用紙をね？ちょっと拝借しようと",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        
    ]
    
    //Mくん
    let nextTextData2 = ["草",
                         "大馬鹿者じゃん",
                         "朝までそこで頭冷やしてなさい",
                         "でも朝見つかったら普通に停学処分レベルの悪行なんだよなぁ",
                         "ウケるわ",
                         "音？",
                         "でも夜勤の先生とか宿直とかいるんでないの？",
                         "変質者ｷﾀ━(ﾟ∀ﾟ)━!",
                         "監視カメラかなんかで外見てみようぜ、気になる",
                         "いつも授業で使ってるWifiがあるでしょおじいちゃん",
                         "Oh…",
                         "なんとかして学内のネットワークに繋げたいなぁ",
                         "は？",
                         "ロッカーにコンセント？？？",
                         "謎すぎるだろ",
                         "？？？？？？？？？？？？？",
                         "PLCってこと？",
                         "もういっその事刺してみれば？",
                         "これでネットワークに入れたら御の字でしょ",
                         "俺知ーーーーーーーーーらね",
                         "何の認証だろ",
                         "ターミナルとかでなんか認証に関するログとかないかなー",
                         "あったらきしょいなー",
                         "何で突破できたんだよきっしょ",
                         "お前そこ出たら会話ログ全部消せよな",
                         "パスワードぉ？",
                         "暗号化されたデータとかペーペー学生にクラックとか出来るわけないよな",
                         "ロッカーに付箋とか貼ってあったらおもろいな。脆弱性の塊魂だったりして",
                         "ﾋｪｯ",
                         "怖すぎる",
                         "すべてのパスワード変えるわ",
                         "…いやまあでも今ばかりは好都合だな",
                         "早速監視カメラにアクセスしてみようぜ",
                         "草",
                         "今すぐTwitchで配信しようぜ",
                         "哀れすぎるw",
                         "そんなこともあろうかと",
                         "工業高校出身のSさん呼んでおいたから",
                         "安心しろ",
                         "まあ1fのカメラでも見て待ってろってw",
                         "",
                         "",
                         
                         
                         
                         
                                ]

    //追加されるテキストデータをインデックス番号で指定
    @Published var nextTextDataIndex = 0//自分のセリフ番号
    @Published var nextTextDataIndex2 = 0//Mくんのセリフ番号
    //ボタンを押した数をカウントしておいてViewを開くたびにボタンを押した分だけまた処理をする
    
   
}


//class BatteryMonitor {
//
//    static let shared = BatteryMonitor()
//
//    var isCharging: Bool {
//        return UIDevice.current.batteryState == .charging
//    }
//
//    private init() {
//        UIDevice.current.isBatteryMonitoringEnabled = true//バッテリーの監視を開始
//        NotificationCenter.default.addObserver(self, selector: #selector(batteryStateChanged), name: UIDevice.batteryStateDidChangeNotification, object: nil)
//    }

//    @objc func batteryStateChanged() {
//        // バッテリーの充電状態が変化したときの処理をここに記述します
//        if isCharging {
//            print("バッテリーは充電中です。")
//
//        } else {
//            print("バッテリーは充電されていません。")
//        }
//    }
//}
