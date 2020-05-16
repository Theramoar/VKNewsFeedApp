//
//  AuthService.swift
//  VKNewsFeed
//
//  Created by Mihails Kuznecovs on 09/07/2019.
//  Copyright © 2019 Mihails Kuznecovs. All rights reserved.
//

import Foundation
import VKSdkFramework

protocol AuthServiceDelegate: class /*данный протокол может использоваться только классами*/ {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceDidSignInFail()
    
}

final class AuthService: NSObject, VKSdkDelegate,  VKSdkUIDelegate {

    private let appID = "7049602"
    private let vkSdk: VKSdk
    
    weak var delegate: AuthServiceDelegate?
    
    var token: String? {
        return VKSdk.accessToken()?.accessToken
    }
    
    var userId: String? {
        return VKSdk.accessToken()?.userId
    }
    
    override init() {
        vkSdk = VKSdk.initialize(withAppId: appID)
        super.init()
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func wakeupSession() {
        let scope = ["wall", "friends"]
        
        VKSdk.wakeUpSession(scope) { [delegate] /*данный closure создаёт копию делегата, и если мы изменяем делегат извне на closure это не влияет*/ (state, error) in
            if state == VKAuthorizationState.authorized {
                delegate?.authServiceSignIn()
                print("VKAuthorizationState.authorized")
            }
            else if state == VKAuthorizationState.initialized {
                print("VKAuthorizationState.initialized")
                VKSdk.authorize(scope)
            }
            else {
                delegate?.authServiceDidSignInFail()
                print("auth problems")
            }
        }
    }
    
    //MARK: - VKSdkDelegate Methods
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            self.delegate?.authServiceSignIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
    }
    
    //MARK: - VKSdkUIDelegate Methods
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        self.delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}

