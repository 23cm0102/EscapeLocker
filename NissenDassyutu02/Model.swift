//
//  Model.swift
//  NissenApp02
//
//  Created by cmStudent on 2023/10/17.
//

import Foundation
import UIKit
import Combine
//
//class Model1 : ObservableObject {
//    //バッテーりのあれこれ、触らないようにしよう！！
//    @Published var hoge: String = "接続なし"
//    @Published var Charging = true
//    private var cancellables: Set<AnyCancellable> = []
//    var isCharging: Bool {
//        return UIDevice.current.batteryState == .charging
//    }
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
//                    self.Charging = false
//                    //充電してない
//                case .unplugged:
//                    self.hoge = "接続を検知できない"
//                    self.Charging = false
//
//                    //充電中
//                case .charging:
//                    self.hoge = "接続を検知"
//                    self.Charging = true
//
//                    //マックス
//                case .full:
//                    print("充電マックス！ダミー")
//
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
//    class BatteryMonitor {
//
//        static let shared = BatteryMonitor()
//
//        var isCharging: Bool {
//            return UIDevice.current.batteryState == .charging
//        }
//
//        private init() {
//            UIDevice.current.isBatteryMonitoringEnabled = true//バッテリーの監視を開始
//            NotificationCenter.default.addObserver(self, selector: #selector(batteryStateChanged), name: UIDevice.batteryStateDidChangeNotification, object: nil)
//        }
//
//        @objc func batteryStateChanged() {
//            // バッテリーの充電状態が変化したときの処理をここに記述します
//            if isCharging {
//                print("バッテリーは充電中です。")
//
//            } else {
//                print("バッテリーは充電されていません。")
//            }
//        }
//    }
//}


class Model: ObservableObject {
    @Published var isCharging = false

    // 充電中かどうか
    @Published  var text = ""
    // バッテリー残量
    @Published  var batteryLevel: Float = 0
    
    private let device = UIDevice.current
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        device.isBatteryMonitoringEnabled = true
        device.publisher(for: \.batteryState)
            .sink { [weak self] status in
                guard let self else { return }
                switch status {
                case .unknown:
                    text = "不明"
                    isCharging = true
                case .unplugged:
                    text = "プラグがささってない"
                    isCharging = true
                case .charging:
                    text = "充電中"
                    isCharging = true
                case .full:
                    text = "フル充電完了"
                    isCharging = true

                default:
                    text = "不明"
                    isCharging = true
                }
            }
            .store(in: &cancellable)
        
        device.publisher(for: \.batteryLevel)
            .map { $0 * 100 }
            .assign(to: &$batteryLevel)
    }
}
//class Model: ObservableObject {
//
//    //充電中かどうか
//    @Published var isCharging = false
//
//    //バッテリー残量
//    @Published var batteryLevel: CGFloat = 100
//
//    let device = UIDevice.current
//    var cancellable = Set<AnyCancellable>()
//
//    init() {
//        device.isBatteryMonitoringEnabled = true
//
//        device.publisher(for: \.batteryState)
//            .sink { [weak self] status in
//
//                guard let self else { return }
//
//                if status == .charging{
//                    self.isCharging = true
//                } else {
//                    self.isCharging = false
//                }
//            }
//            .store(in: &cancellable)
//
//        device.publisher(for: \.batteryLevel)
//            .map { CGFloat($0) * 100 }
//            .assign(to: &$batteryLevel)
//    }
//}

//
//class Model: ObservableObject {
//    @Published var isCharging = false
//    @Published var batteryLevel: CGFloat = 100
//
//    let device = UIDevice.current
//    var cancellable = Set<AnyCancellable>()
//
//    init() {
//        device.isBatteryMonitoringEnabled = true
//
//        // バッテリーの充電状態を監視
//        device.publisher(for: \.batteryState)
//            .sink { [weak self] status in
//                guard let self = self else { return }
//                self.isCharging = status == .charging
//            }
//            .store(in: &cancellable)
//
//        // バッテリーレベルを監視
//        device.publisher(for: \.batteryLevel)
//            .map { CGFloat($0) * 100 }
//            .assign(to: &$batteryLevel)
//    }
//}
//
