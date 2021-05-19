//
//  AppDelegate.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        test()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    
    func test() {
        // メッセージにE540001、E540002が含まれる場合のみ `Gxx`といったようなコードでエラーを特定する
        var message = ""
        var msg = "C55 BankPay【MPM】決済要求に失敗しました。処理を中断します。error：jdebit_api_failed, error_description：E540001;7ad12115-bdbd-4fbf-b3d4-a5c4620a6697;2021-04-27 16:00:48, error_parameter：, error_detail_message：口座情報が無効化されています"

        if msg.containArray(["E540001", "E540002"]) {
            let errorRetry = ["C01", "C03", "C12", "C13", "C14", "C15", "C20", "C21", "C22", "C23", "C24", "C25", "C33", "C34", "C35", "C50", "C51", "C53", "C54", "C55", "C56", "C57", "C58", "C60", "G65", "G68", "G77", "G78", "G80", "G81", "G91", "G94", "G95", "G97", "G98", "G99"]
            let errorNoAccount = ["G60", "G83", "G85"]
            if msg.containArray(["G06"]) {
                message = "残高が不足しております。"
            } else if msg.containArray(["G07"]) {
                message = "限度額を超えています。"
            } else if msg.containArray(["G42"]) {
                message = "暗証番号が一致しません。"
            } else if msg.containArray(["G43"]) {
                message = "異なる暗証番号が規定回数入力されています。時間をおいて再度お試しください。"
            } else if msg.containArray(errorRetry) {
                message = "時間をおいて、再度お試しください。"
            } else if msg.containArray(errorNoAccount) {
                message = "指定された口座はご利用できません。"
            }
        }

        print(message)
        print(message)
    }
}


extension String {
    func containArray(_ texts: [String]) -> Bool {
        texts.contains { self.contains($0) }
    }
}
