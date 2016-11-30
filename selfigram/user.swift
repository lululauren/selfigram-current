//
//  user.swift
//  selfigram
//
//  Created by Lauren  Kemp on 2016-11-15.
//  Copyright © 2016 Lauren  Kemp. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    let username:String
    let profileImage:UIImage
    
    init(aUsername:String, aProfileImage:UIImage){
        //we are setting the User property of "username" to an aUsername property you are going to pass in
        username = aUsername
        profileImage = aProfileImage
    }
}
