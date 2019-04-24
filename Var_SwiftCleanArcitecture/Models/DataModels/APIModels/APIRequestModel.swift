//
//  APIRequestModel.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 24/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import Foundation
import UIKit


struct APIRequestModel {
    
    enum HTTPMethod:String {
        case get = "GET"
        case post = "Post"
    }
    
    enum Encoding {
        case urlEncoded
        case json
    }
    
    
}
