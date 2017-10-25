//
//  GoogleAnalyticsService.swift
//  Analytics
//
//  Created by Mahesh Asabe on 17/10/17.
//  Copyright © 2017 Mahesh Asabe. All rights reserved.
//

import Foundation

class GoogleAnalyticsService: AnalyticsService {
    init() {
        print("GA Service initialized")
        // TODO: - Do all initial setup here
        // TODO: - write all default tracking code here
    }
    
    func track(event: Event) {
        if (event.params.isEmpty) {
            GoogleAnalytics.track(event.name.value)
        } else {
            GoogleAnalytics.track(event.name.value, params: event.params)
        }
    }
    
    var trackingEvents: [EventName] {
        return [EventName.loginWithEmail]
    }
}
