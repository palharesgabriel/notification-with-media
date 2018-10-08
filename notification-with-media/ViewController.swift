//
//  ViewController.swift
//  notification-with-media
//
//  Created by Gabriel Palhares on 08/10/18.
//  Copyright © 2018 Gabriel Palhares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = NotificationHandler.shared.createNotification()
        NotificationHandler.shared.registerNotification(request)
        
    }


}

