//
//  DataHandling.swift
//  OnTheMap
//
//  Created by nouf alharbi on 2/13/19.
//  Copyright © 2019 nouf alharbi. All rights reserved.
//

import Foundation
class DataHandling { 
    static let shared = DataHandling()
    
    func handleErrors(_ data: Data?, _ response: URLResponse?, _ error: NSError?, completionHandler: @escaping (_ result: [String:AnyObject]?, _ success: Bool, _ error: String?) -> Void) {
        
        guard (error == nil) else {
            completionHandler(nil, false, ConstantsUdacity.NetworkProblem)
            return
        }
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
            completionHandler(nil, false, ConstantsUdacity.IncorrectDetail)
            return
        }
        
        guard let _ = data else {
            completionHandler(nil, false, ConstantsUdacity.NoData)
            return
        }
    }
    
}
