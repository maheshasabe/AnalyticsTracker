//
//  OnboardingAnalyticsMapper.swift
//  Analytics
//
//  Created by Mahesh Asabe on 17/10/17.
//  Copyright © 2017 Mahesh Asabe. All rights reserved.
//

import Foundation

struct OnboardingAnalyticsMapper
{
    static func trackEditionChangeEvent(_ newEdition:String)
    {
    }
    
    static func trackFavoriteChangeEvent(_ favorites:[String])
    {
    }
    
    static func trackSignInEvent(_ loggedInUbser:User)
    {
        let event = EventFactory.createEvent(for:EventName.loginWithEmail)
        
        //Set value from input parameter
        event.addAttribute(loggedInUbser.name, forKey: "name")
        event.addAttribute(loggedInUbser.surname, forKey: "surname")
        event.addAttribute(loggedInUbser.imageURL, forKey: "imageUrl")
        event.addAttribute(loggedInUbser.gender, forKey: "gender")
        
        //Set constant values
        event.addAttribute("Admin", forKey: "role")

        //IF VALUE NOT SET THEN IT WILL TAKE DEFAULT VALUE
        //event.addAttribute("user_id", forKey: "id")
        //event.addAttribute("user_emailId", forKey: "email")
        
        
        //NOT TRACKABLE ATTRIBUTE 'fender' - Will abort
        //event.addAttribute("user_gender", forKey: "fender")
        
        AnalyticsManager.shared.track(event: event)
    }
    
    static func trackSignUpEvent(_ loggedInUbser:User)
    {
    }
}
