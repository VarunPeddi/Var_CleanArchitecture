//
//  ListWorkers.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 24/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import UIKit

protocol ListWorkersProtocolDelegate:class {
    var listInteractor:ListInteractorProtocolDelegate? { get set }
    func callRequestApi(completionHandler:@escaping(Any) -> Void)
}

class ListWorkers: NSObject,ListWorkersProtocolDelegate {
    
    
  
    

    var webServiceManager:APIClient?
    
    var listInteractor:ListInteractorProtocolDelegate?
    
    init(serviceManager:APIClient) {
        self.webServiceManager = serviceManager
    }
    
    func callRequestApi(completionHandler: @escaping (Any) -> Void) {
        webServiceManager?.makeAsycCallRequestAPI(completionHandler: { (response, error) in
            print(response)
              let when = DispatchTime.now() + 0.1
              DispatchQueue.main.asyncAfter(deadline: when, execute: {
                completionHandler(response)
            })
        })
    }
    
}
