//
//  AuthViewController.swift
//  VKNewsFeed
//
//  Created by Mihails Kuznecovs on 09/07/2019.
//  Copyright © 2019 Mihails Kuznecovs. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authService = AppDelegate.shared().authService
    }
    

    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeupSession()
    }
    
}
