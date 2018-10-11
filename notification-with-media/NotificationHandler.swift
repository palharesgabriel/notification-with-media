//
//  NotificationHandler.swift
//  notification-with-media
//
//  Created by Gabriel Palhares on 08/10/18.
//  Copyright © 2018 Gabriel Palhares. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationHandler {
    
    static let shared = NotificationHandler()
    private init() {}
    
    
    func requestAuthorization() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { (succeded, error) in
            
            if(succeded) {
                print("Permission granted")
            }
            else {
                print("Permission denied")
            }
        }
        
    }
    
    
    func createNotification() -> UNNotificationRequest {
        
        let content = UNMutableNotificationContent()
        content.title = "Bom dia seu lindo"
        content.subtitle = "Tá na hora do show em"
        content.body = "blablaalblablablalbalbalblablalbalblablalbalbl"
        
        let urlImage = Bundle.main.url(forResource: "image", withExtension: "jpg")
        
        do {
            content.attachments = try [UNNotificationAttachment(identifier: "image", url: urlImage!, options: nil)]
        } catch {
            print(error.localizedDescription)
        }
       
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
        
        let request = UNNotificationRequest(identifier: "teste", content: content, trigger: trigger)
        
        return request
    }
    
    
    
    /// Create a simple message notification
    ///
    /// - Parameters:
    ///   - title: Notification title
    ///   - subtitle: Notification subtitle
    ///   - body: Notification message
    ///   - delayTime: Delay time to deliver notification after schedule notification
    ///   - repeats: Define if the notification repeats
    /// - Returns: Object UNNotificationRequest with content passed by parameters
    func createNotificationWith(title: String, subtitle: String, body: String, delayTime: TimeInterval, repeats: Bool) -> UNNotificationRequest {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: delayTime, repeats: repeats)
        let request = UNNotificationRequest(identifier: "\(title)_id", content: content, trigger: trigger)
        
        return request
    }
    
    
    func registerNotification(_ notificationRequest: UNNotificationRequest) {
        
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if(error != nil) {
                print("Registration failed")
            }
        }
        
    }
    
}
