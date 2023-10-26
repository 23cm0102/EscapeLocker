//
//  MessageAppView.swift
//  NissenApp02
//
//  Created by cmStudent on 2023/10/07.
//

import SwiftUI

struct MessageAppView0: View {
    
    @ObservedObject var messageVM : MessageAppViewModel
    @ObservedObject var model : Model

    func appendTextData (){

        switch messageVM.nextTextDataIndex2 {
            //相手が１で自分が２
        case 99 :
            
            messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData[messageVM.nextTextDataIndex], textColor: .white, boxColor: .blue, marginLeft: .infinity, marginRight: CGFloat(0)))
            messageVM.nextTextDataIndex += 1
            
            messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData[messageVM.nextTextDataIndex], textColor: .white, boxColor: .blue, marginLeft: .infinity, marginRight: CGFloat(0)))
            messageVM.nextTextDataIndex += 1
            
            //相手が１で自分が３
        case 98 :
            messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData[messageVM.nextTextDataIndex], textColor: .white, boxColor: .blue, marginLeft: .infinity, marginRight: CGFloat(0)))
            messageVM.nextTextDataIndex += 1
            messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData[messageVM.nextTextDataIndex], textColor: .white, boxColor: .blue, marginLeft: .infinity, marginRight: CGFloat(0)))
            messageVM.nextTextDataIndex += 1
            messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData[messageVM.nextTextDataIndex], textColor: .white, boxColor: .blue, marginLeft: .infinity, marginRight: CGFloat(0)))
            messageVM.nextTextDataIndex += 1
            
            //いちいち
        default :
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData[messageVM.nextTextDataIndex], textColor: .white, boxColor: .blue, marginLeft: .infinity, marginRight: CGFloat(0)))
                messageVM.nextTextDataIndex += 1
        }
        switch messageVM.nextTextDataIndex {
            //自分が１で相手が2
        case 3,11,13,18,24:
            print("1-2")
            closeNextText = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData2[messageVM.nextTextDataIndex2],textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity))
                messageVM.nextTextDataIndex2 += 1
                sousinSound.play()


            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData2[messageVM.nextTextDataIndex2],textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity))
                messageVM.nextTextDataIndex2 += 1
                closeNextText = false
                sousinSound.play()


            }
            
            //自分が１で相手が３
        case 2,12,14,17,19,25:
            print("1-3")
            closeNextText = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData2[messageVM.nextTextDataIndex2],textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity))
                messageVM.nextTextDataIndex2 += 1
                sousinSound.play()


            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData2[messageVM.nextTextDataIndex2],textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity))
                messageVM.nextTextDataIndex2 += 1
                sousinSound.play()


            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData2[messageVM.nextTextDataIndex2],textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity))
                messageVM.nextTextDataIndex2 += 1
                sousinSound.play()


                closeNextText = false
            }
            //じぶんが１で相手が5
        case 21 :
            print("1-2")
            closeNextText = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData2[messageVM.nextTextDataIndex2],textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity))
                messageVM.nextTextDataIndex2 += 1
                sousinSound.play()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.7){
                
                
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData2[messageVM.nextTextDataIndex2],textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity))
                messageVM.nextTextDataIndex2 += 1
                sousinSound.play()
                
            }
         
            DispatchQueue.main.asyncAfter(deadline: .now() + 2 ){
                
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData2[messageVM.nextTextDataIndex2],textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity))
                messageVM.nextTextDataIndex2 += 1
                sousinSound.play()
            }
            
          
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5){
                
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData2[messageVM.nextTextDataIndex2],textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity))
                messageVM.nextTextDataIndex2 += 1
                sousinSound.play()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData2[messageVM.nextTextDataIndex2],textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity))
                messageVM.nextTextDataIndex2 += 1
                closeNextText = false
                sousinSound.play()

            }
        case 1,4,6,15,16,20,23 :
            //返信なし、
            print("返信無しの場合")
          
            //いちいち
        default :
            print("1-1")

            closeNextText = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                
                messageVM.textData.append(MessageAppViewModel.MessageBox(text: messageVM.nextTextData2[messageVM.nextTextDataIndex2],textColor:.black,boxColor: .gray.opacity(0.5),marginLeft: CGFloat(0), marginRight: .infinity))
                messageVM.nextTextDataIndex2 += 1
                closeNextText = false
                sousinSound.play()

            }
            
            
            
            }
        }
    
    
  
    
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    ScrollViewReader{ v in
                        ScrollView{
                            ForEach(messageVM.textData, id: \.id){ item in
                                
                                item
                                
                            }.id(30)
                        }
                        .toolbar {
                            HStack{
                                Text("Mくん")
                                Spacer()
                                Button(action: messageVM.messageAppOpenClose) {
                                    Image(systemName: "chevron.up")
                                }
                            }
                        }
                        .frame(height:messageVM.messageListFrame)
                        TextField("返信する(↓ボタンを押す)", text: $messageVM.text)
                            .textFieldStyle(.roundedBorder)
                            .onTapGesture(perform: { withAnimation (.easeIn) {
                                messageVM.messageListFrame = 250
                            }
                            })
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    HStack {
                                        Button(closeNextText ?
                                               toDoText[todoTextIndex]:
                                                messageVM.nextTextData[messageVM.nextTextDataIndex]) {
                                            appendTextData()
                                            print("データインデックス\(messageVM.textData.count)")
                                            ButtonCountUp()
                                        }.disabled(closeNextText)
                                        }
                                    }
                                }
                        Spacer()
                    }//画面を閉じる
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        //アニメーションでリストのframeを変える
                        withAnimation (.easeIn) {
                            messageVM.messageListFrame = 500
                        }
                    }
                }
//                .onChange(of: model.isCharging) { newValue in
//                    messageVM.isShowAleatView = true
//                }
                if todoTextIndex == 1 && model.isCharging{
                        aleatView(messageVM: messageVM)
                    }
                }
                
//                if model.Charging && messageVM.isShowAleatView{
//                    if todoTextIndex == 1{
//                    }
//                }
            
        }.onAppear {
            if todoTextIndex == 10{
                messageVM.isShowClearView = true
            }
        }.fullScreenCover(isPresented: $messageVM.isShowClearView, content: {
            ChoiseView(messageVM: messageVM)
        })
        }
        
    }

//テキストの大きさを測る
struct TextSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
//ボックスのView
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

struct ChoiseView : View {
    @ObservedObject var messageVM : MessageAppViewModel
    let textText = "ロッカーの中で狼の存在に恐怖し震えていると外から「そこまでだ」聞いたことのある声、\n工業高校出身で霊感の強いSさんだ\n強固に施錠されたロッカーの前に来ると、自前の腕力で扉を引き裂いた。\n「どうもありがとうございます！」\nSさんに感謝を伝える頃には周りに狼の姿はなく、除霊されていた。\nやっぱり工業高校出身はすごい、そう思いながら私は学校を後にした..."
    
    
    let creditText = "お世話になった方達\n・"
    let text = "以上でクリアとなるので担当の生徒に助けを呼んでください！\nガバガバ設定だったけど最後までプレイしてくれてありがとうございました！"
    var body: some View{
        VStack{
            Text("ミッションクリア！")
                .font(.body)
                .fontWeight(.bold)
                .padding(3.0)
                
            Text(textText)
            Spacer()
            Text(text).foregroundColor(.red)
            Spacer()

                
                
         
            
        }
    }
}

//充電された時のアラートのView
struct aleatView : View{
    @ObservedObject var messageVM : MessageAppViewModel
    var body : some  View{
        ZStack{
            VStack{
                Text("外部からの接続を検出しました。")
                Text("アクセスをするには認証を行なってください")
                Button("閉じる"){
                        messageVM.isShowAleatView = false
                    if todoTextIndex == 1{
                        ButtonOpen()
                    }
                        print("オンタップ！")
                }.foregroundColor(.blue)
            }.foregroundColor(.green)
                .background(content: {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.black)
                })
        }
    }
}
struct MessageAppView_Previews: PreviewProvider {
    static var previews: some View {
        
        let dummyViewModel = MessageAppViewModel()
        let dummyViewModel2 = Model()


//        ChoiseView(messageVM: dummyViewModel)
        
        MessageAppView0(messageVM: dummyViewModel, model: dummyViewModel2)
    }
}

