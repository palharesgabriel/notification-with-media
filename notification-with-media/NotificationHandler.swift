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
        
        UNUserNotificationCenter.current().requestAuthorization(options: <#T##UNAuthorizationOptions#>, completionHandler: <#T##(Bool, Error?) -> Void#>)
        
    }
    
}
