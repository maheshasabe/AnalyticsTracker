//
//  Event.swift
//  Analytics
//
//  Created by Mahesh Asabe on 17/10/17.
//  Copyright © 2017 Mahesh Asabe. All rights reserved.
//

import Foundation

class EventFactory
{
    private static var events: [AnyHashable: Event] = [AnyHashable: Event]()
    
    static func createEvent(for eventName:EventName) -> Event
    {
        var event:Any? = events[eventName]
        if event == nil {
            event = Event.init(eventName:eventName)
        }
        return event as! Event
    }
    
    static func removeEvent(for eventName:EventName)
    {
        let event:Any? = events[eventName]
        if event != nil {
            events.removeValue(forKey: eventName)
        }
    }
}

class Event {
    
    private (set) var name: EventName
    private (set) var params: [AnyHashable: Any]
    
    init(eventName:EventName) {
        self.name = eventName
        self.params = eventName.attributes
    }
   
    init(name: EventName, params: [AnyHashable: Any] = [:]) {
        self.name = name
        self.params = params
    }
     
    func addAttribute(_ attribute:Any, forKey key: AnyHashable) {
        if (self.params[key] != nil) {
            self.params[key] = attribute
        }else {
            assert((self.params[key] != nil), "Invalid attribute: \(key)")
        }
    }
}


enum EventName: Int {
    case loginWithEmail = 0
    case loginWithFacebook
    case loginWithGoogle
    case registerWithEmail
    case updateProfileInfo
    case updateProfileImage
    
    var value: String {
        switch self {
            case .loginWithEmail        : return "Login with email"
            case .loginWithFacebook     : return "Login with Facebook"
            case .loginWithGoogle       : return "Login with Google"
            case .registerWithEmail     : return "Register with email"
            case .updateProfileInfo     : return "Update profile info"
            case .updateProfileImage    : return "Update profile image"
        }
    }
    
    var attributes: [String:String] {
        
        switch self {
            case .loginWithEmail        : return ["id":"No Id available",
                                                  "name":"No name available",
                                                  "surname":"No surname available",
                                                  "imageUrl":"No imageUrl available",
                                                  "email":"No email available",
                                                  "gender":"No gender available",
                                                  "role":"No role available",
                                                    ]
            case .loginWithFacebook     : return ["id":"No Id available",
                                                  "name":"No name available",
                                                  "surname":"No surname available",
                                                  "imageUrl":"No imageUrl available",
                                                  "facebookId":"No FacebookId available",
                                                  "gender":"No gender available",
                                                    ]
            case .loginWithGoogle       : return ["Login with email":"Login with email"]
            case .registerWithEmail     : return ["Login with email":"Login with email"]
            case .updateProfileInfo     : return ["Login with email":"Login with email"]
            case .updateProfileImage    : return ["Login with email":"Login with email"]
        }
    }
}

extension EventName {
    static var all: [EventName] = {
        var index = 0
        var events = [EventName]()
        while let event = EventName(rawValue: index) {
            events.append(event)
            index += 1
        }
        return events
    }()
}

