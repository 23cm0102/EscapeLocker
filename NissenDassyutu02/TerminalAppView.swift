//
//  TerminalAppView.swift
//  NissenApp02
//
//  Created by cmStudent on 2023/10/09.
//

import SwiftUI
import Combine




struct TerminalAppView: View {
    @ObservedObject var terminalVM : TerminalAppViewModel
    @ObservedObject var model : Model
    @State var chargi : UIDevice.BatteryState = UIDevice.current.batteryState
    
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                ScrollView{
                    HStack{
                        VStack(alignment:.leading){
                            Text("student@iPhone ~ %")
                            if model.isCharging{
                                ForEach(terminalVM.commandText, id: \.self) { item in
                                    Text(item)
                                }
                                Text("student@iPhone ~ %")
                            }
                        }
                        .font(.footnote)
                        .foregroundColor(.green)
                        Spacer()
                        
                    }
                    PassView(terminalVM: terminalVM)
                        .scaleEffect(terminalVM.isShowPassView ? 1.0 : 0)
                        .animation(.linear, value: terminalVM.isShowPassView)
                }
            }.frame(maxWidth:.infinity)
                .background {
                    Rectangle()
                        .foregroundColor(.black)
                        .ignoresSafeArea(.all)
                    
                }
                .onAppear(perform: {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        if todoTextIndex == 3{//ターミナルアプリを確認する
                            ButtonOpen()
                            self.terminalVM.isShowPassView = true
                            //model.startMonitoring()
                        }
                    }
                }).disabled(!model.isCharging)
                .onTapGesture(perform: {
                    terminalVM.isShowPassView.toggle()
                }).disabled(!model.isCharging)
                .toolbar {
                    HStack{
//                        switch chargi{
//                        case .charging:
//                            Text("教員用サーバーに接続中")
//                                .foregroundColor(.green)
//
//
//                        default:
//                            Text("接続なし")
//                                .foregroundColor(.green)
//
//                        }
                        Text(model.isCharging ?  "教員用サーバーに接続中" : "接続なし" )
                            .foregroundColor(.green)
                        Text("ターミナル")
                            .foregroundColor(.green)
                        
                        Button(action: terminalVM.terminalAppOpenClose) {
                            Image(systemName: "chevron.up")
                        }
                    }
                }
        }
    }
}

struct PassView : View {
    @ObservedObject var terminalVM : TerminalAppViewModel
    var body: some View{
        ZStack{
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity) // 画面全体に広がる矩形
                .foregroundColor(Color.black) // 赤色の背景
                .edgesIgnoringSafeArea(.all) // セーフエリアを無視して背景を画面全体に広げる
            
            VStack{
                Text(terminalVM.toDoText)
                    .frame(width:300,height:50)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(terminalVM.passViewColor)
                Text(terminalVM.passText)
                    .frame(width:300,height:50)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(terminalVM.passViewColor)
                    .background {
                        Rectangle()
                            .stroke(lineWidth: 3)
                            .frame(width:300,height:50)
                            .foregroundColor(terminalVM.passViewColor)
                        
                    }
                HStack{
                    Button {
                        terminalVM.passText.append(contentsOf: "1")

                    }label: {
                        Rectangle()
                            .stroke(lineWidth: 3)
                            .frame(width:60,height:60)
                            .foregroundColor(terminalVM.passViewColor)
                            .padding()
                            .overlay {
                                Text("1")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(terminalVM.passViewColor)
                            }
                    }.disabled(!terminalVM.isShowPassView)
                    
                    Button {
                        terminalVM.passText.append(contentsOf: "2")
                    } label: {
                        Rectangle()
                            .stroke(lineWidth: 3)
                            .frame(width:60,height:60)
                            .foregroundColor(terminalVM.passViewColor)
                            .padding()
                            .overlay {
                                Text("2")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(terminalVM.passViewColor)
                            }
                    }.disabled(!terminalVM.isShowPassView)
                    Button {
                        terminalVM.passText.append(contentsOf: "3")                    } label: {
                            Rectangle()
                                .stroke(lineWidth: 3)
                                .frame(width:60,height:60)
                                .foregroundColor(terminalVM.passViewColor)
                                .padding()
                                .overlay {
                                    Text("3")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(terminalVM.passViewColor)
                                }
                        }.disabled(!terminalVM.isShowPassView)
                }
                HStack{
                    Button {
                        terminalVM.passText.append(contentsOf: "4")                    } label: {
                            Rectangle()
                                .stroke(lineWidth: 3)
                                .frame(width:60,height:60)
                                .foregroundColor(terminalVM.passViewColor)
                                .padding()
                                .overlay {
                                    Text("4")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(terminalVM.passViewColor)
                                }
                        }.disabled(!terminalVM.isShowPassView)
                    Button {
                        terminalVM.passText.append(contentsOf: "5")                    } label: {
                            Rectangle()
                                .stroke(lineWidth: 3)
                                .frame(width:60,height:60)
                                .foregroundColor(terminalVM.passViewColor)
                                .padding()
                                .overlay {
                                    Text("5")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(terminalVM.passViewColor)
                                }
                        }.disabled(!terminalVM.isShowPassView)
                    Button {
                        terminalVM.passText.append(contentsOf: "6")                    } label: {
                            Rectangle()
                                .stroke(lineWidth: 3)
                                .frame(width:60,height:60)
                                .foregroundColor(terminalVM.passViewColor)
                                .padding()
                                .overlay {
                                    Text("6")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(terminalVM.passViewColor)
                                }
                        }.disabled(!terminalVM.isShowPassView)
                }
                HStack{
                    Button {
                        terminalVM.passText.append(contentsOf: "7")                    } label: {
                            Rectangle()
                                .stroke(lineWidth: 3)
                                .frame(width:60,height:60)
                                .foregroundColor(terminalVM.passViewColor)
                                .padding()
                                .overlay {
                                    Text("7")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(terminalVM.passViewColor)
                                }
                        }.disabled(!terminalVM.isShowPassView)
                    Button {
                        terminalVM.passText.append(contentsOf: "8")                    } label: {
                            Rectangle()
                                .stroke(lineWidth: 3)
                                .frame(width:60,height:60)
                                .foregroundColor(terminalVM.passViewColor)
                                .padding()
                                .overlay {
                                    Text("8")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(terminalVM.passViewColor)
                                }
                        }.disabled(!terminalVM.isShowPassView)
                    Button {
                        terminalVM.passText.append(contentsOf: "9")                    } label: {
                            Rectangle()
                                .stroke(lineWidth: 3)
                                .frame(width:60,height:60)
                                .foregroundColor(terminalVM.passViewColor)
                                .padding()
                                .overlay {
                                    Text("9")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(terminalVM.passViewColor)
                                }
                        }.disabled(!terminalVM.isShowPassView)
                    
                    
                    
                    
                }
                HStack{
                    Button {
                        terminalVM.passReset()
                    } label: {
                        Rectangle()
                            .stroke(lineWidth: 3)
                            .frame(width:60,height:60)
                        //                            .foregroundColor(.green)
                            .padding()
                            .overlay {
                                Image(systemName: "delete.left")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                //                                    .foregroundColor(.green)
                            }
                    }.disabled(!terminalVM.isShowPassView)
                    Button {
                        terminalVM.passText.append(contentsOf: "0")                    } label: {
                            Rectangle()
                                .stroke(lineWidth: 3)
                                .frame(width:60,height:60)
                                .foregroundColor(terminalVM.passViewColor)
                                .padding()
                                .overlay {
                                    Text("0")
                                        .font(.largeTitle)
                                        .fontWeight(.heavy)
                                        .foregroundColor(terminalVM.passViewColor)
                                }
                        }.disabled(!terminalVM.isShowPassView)
                    Button {
                        terminalVM.isLogin ? terminalVM.dataOpen() :terminalVM.passJudje()

                    } label: {
                        Rectangle()
                            .stroke(lineWidth: 3)
                            .frame(width:60,height:60)
                        //                            .foregroundColor(.green)
                            .padding()
                            .overlay {
                                Image(systemName: "return")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                //                                    .foregroundColor(.green)
                            }
                    }.disabled(!terminalVM.isShowPassView)
                    .sheet(isPresented: $terminalVM.isShowVideoPlaySheet) {
                        if terminalVM.passText == "751731"{
                            VideoPlayerView()
                        }else if terminalVM.passText == "712781" {
                            VideoPlayerView1f()
                        }
                    }
                    
                        
                    
                    
                    
                    
                }
            }
        }
    }
}

struct TerminalAppView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyViewModel = TerminalAppViewModel()
        let dummyViewModel2 = Model()
        
        TerminalAppView(terminalVM: dummyViewModel, model: dummyViewModel2)
        //        PassView(terminalVM: dummyViewModel)
        
    }
}

