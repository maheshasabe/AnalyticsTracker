//
//  AnalyticsService.swift
//  Analytics
//
//  Created by Mahesh Asabe on 17/10/17.
//  Copyright © 2017 Mahesh Asabe. All rights reserved.
//

import Foundation

protocol AnalyticsService {
    func track(event: Event)
    var trackingEvents: [EventName] { get }
}

// Default behavior
extension AnalyticsService {
    var trackingEvents: [EventName] {
        return EventName.all
    }
}

// Convenience methods
extension AnalyticsService {
    func shouldTrack(eventName: EventName) -> Bool {
        return self.trackingEvents.contains(eventName)
    }
}

