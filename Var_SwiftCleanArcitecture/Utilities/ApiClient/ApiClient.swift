//
//  ApiClient.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 24/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import Foundation
import UIKit


protocol APIClient {
    
    func makeAsycCallRequestAPI(completionHandler: @escaping(Any,APIError?) -> Void)
    
}
