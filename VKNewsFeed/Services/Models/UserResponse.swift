//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by Mihails Kuznecovs on 29/07/2019.
//  Copyright © 2019 Mihails Kuznecovs. All rights reserved.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
    
}

struct UserResponse: Decodable {
    let photo100: String?
}
