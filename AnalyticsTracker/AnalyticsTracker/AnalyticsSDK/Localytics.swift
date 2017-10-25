//
//  Localytics.swift
//  Analytics
//
//  Created by Mahesh Asabe on 17/10/17.
//  Copyright © 2017 Mahesh Asabe. All rights reserved.
//

import Foundation

struct Localytics {
    
    //Dummy looging for testing
    public static func track(_ event: String, params: [AnyHashable: Any]? = nil) {
        print("Localytics Analytics logging \nA Event :-> \(event) \nParameters:-> \n \(String(describing: params))")
    }
}
