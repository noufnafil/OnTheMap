//
//  ParseAndUdacityConstants.swift
//  OnTheMap
//
//  Created by nouf alharbi on 2/13/19.
//  Copyright © 2019 nouf alharbi. All rights reserved.
//


import Foundation
struct ConstantsUdacity {
    
    static let ApiSessionUrl = "https://www.udacity.com/api/session"
    static let ApiUserIdUrl = "https://www.udacity.com/api/users/"
    static let SignUpUrl = "https://www.udacity.com/account/auth#!/signup"
    static let NetworkProblem = "Not connected to a network. Check your network settings."
    static let IncorrectDetail = "Incorrect details. Please enter correct details."
    static let NoData = "No match was found!"
}


struct ConstantsParse {
    static let ApiUrl = "https://parse.udacity.com/parse/classes"
    static let AppId = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
    static let ApiKey = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
    static let DefaultURL = "http://www.udacity.com"
    static let StudentLocation = "StudentLocation"
    static let LimitAndOrder = "?limit=100&order=-updatedAt"
    static let NoName = "Anonymous"
}
