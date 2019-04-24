//
//  WebServiceManager.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 24/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import UIKit

class WebServiceManager: NSObject, APIClient {
    
    func makeAsycCallRequestAPI(completionHandler: @escaping (Any, APIError?) -> Void) {
        if let path = Bundle.main.path(forResource: "Sample", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let when = DispatchTime.now() + 0.1
                DispatchQueue.main.asyncAfter(deadline: when) {
                 completionHandler(jsonResult,nil)
                }
            } catch {
                // handle error
            }
        }
    }
}
