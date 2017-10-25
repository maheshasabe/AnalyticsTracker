//
//  AnalyticsManager.swift
//  Analytics
//
//  Created by Mahesh Asabe on 17/10/17.
//  Copyright © 2017 Mahesh Asabe. All rights reserved.
//

import Foundation

class AnalyticsManager {
    static let shared = AnalyticsManager()
    private var analyticsServices: [AnalyticsService] = []
    private init() { }
    
    @discardableResult func addService(service: AnalyticsService) -> AnalyticsManager {
        self.analyticsServices.append(service)
        return self
    }
    
    public func track(event: Event) {
       
        for service in analyticsServices where service.shouldTrack(eventName:event.name) {
            service.track(event: event)
        }
        
        EventFactory.removeEvent(for: event.name)
    }
}
