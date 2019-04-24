//
//  DataManager.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 23/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import UIKit

protocol DataManagerProtocolDelegate {
    var loginInteractor:LoginInteractorProtocolDelagate? { get set }
    var listInteractor:ListInteractorProtocolDelegate? { get set }
    
    func sendingDataDetails(_ name:String, password:String)
}



class DataManager: DataManagerProtocolDelegate {
    
    
    // Initializing Interactor Details
    weak var loginInteractor:LoginInteractorProtocolDelagate?
    weak var listInteractor: ListInteractorProtocolDelegate?

    
    func sendingDataDetails(_ name: String, password: String) {
        let when = DispatchTime.now() + 0.5
        DispatchQueue.main.asyncAfter(deadline: when) {
            if name == "Varun" && password == "123456" {
            self.loginInteractor?.gettingDataFromDatamanager(UserModel.init(username: name, password: "123456"))
            } else {
                self.loginInteractor?.gettingDataFromDatamanager(nil)
            }
        }
    }
}
