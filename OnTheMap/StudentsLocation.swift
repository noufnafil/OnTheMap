//
//  StudentsLocation.swift
//  OnTheMap
//
//  Created by nouf alharbi on 2/13/19.
//  Copyright © 2019 nouf alharbi. All rights reserved.
//

import Foundation
struct StudentLocation {
    
    static var studentLocations = [StudentLocation]()
    
    var firstName: String?
    var lastName: String?
    var latitude: Double?
    var longitude: Double?
    var mapString: String?
    var mediaURL: String?
    var uniqueKey: String?
    
    var fullName: String {
        return "\(String(describing: firstName)) \(String(describing: lastName))"
    }
    
    init(dictionary: [String:AnyObject]) {
        self.firstName = dictionary["firstName"] as? String
        self.lastName = dictionary["lastName"]  as? String
        self.latitude = dictionary["latitude"]  as? Double
        self.longitude = dictionary["longitude"] as? Double
        self.mapString = dictionary["mapString"] as? String
        self.mediaURL = dictionary["mediaURL"]  as? String
        self.uniqueKey = dictionary["uniqueKey"] as? String
    }
    
}
