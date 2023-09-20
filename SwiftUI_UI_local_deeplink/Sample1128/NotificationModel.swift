import UserNotifications

class NotificationModel: ObservableObject {

    let notificationIdentifier = "NotificationTest"
    var notificationDelegate = ForegroundNotificationDelegate()

    init() {
        //フォアグラウンド通知用、バックグラウンドのみなら不要
        UNUserNotificationCenter.current().delegate = self.notificationDelegate
    }

    func setNotification(){

        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound, .badge]){
            (granted, _) in
            if granted {
                //許可
                self.makeNotification()
            }else{
                //非許可
            }
        }

    }

    func makeNotification(){

        //日時
        let notificationDate = Date().addingTimeInterval(10)//10秒後
        let dateComp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: notificationDate)

        //日時でトリガー指定
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)

        //通知内容
        let content = UNMutableNotificationContent()
        content.title = "NotificationTitle"
        content.body = "NotificationBody"
        content.sound = UNNotificationSound.default

        //リクエスト作成
        let request = UNNotificationRequest(identifier: self.notificationIdentifier, content: content, trigger: trigger)

        //通知をセット
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

    func removeNotification(){
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [self.notificationIdentifier])
    }
}


//フォアグラウンド通知用、バックグラウンドのみなら不要
class ForegroundNotificationDelegate:NSObject,UNUserNotificationCenterDelegate{
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //completionHandler([.alert, .list, .badge, .sound]) //~iOS13
        completionHandler([.banner, .list, .badge, .sound]) //iOS14~
    }
}
