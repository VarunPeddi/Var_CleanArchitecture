//
//  LoginInteractor.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 23/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import UIKit

protocol LoginInteractorProtocolDelagate:class {
    var presenter:LoginPresenterPrototolDelegate? { get set }
    func sendingDetailsToInteractor(_ name:String, password:String)
    func gettingDataFromDatamanager(_ userModel:UserModel?)
}

class LoginInteractor: LoginInteractorProtocolDelagate {
    
   weak var presenter: LoginPresenterPrototolDelegate?
    
   
    // Initializing Data Manager PROTOCOL to send Data
    let dataManagerProtocol:DataManagerProtocolDelegate
    
    // Intializing Presenter to send data to view
    weak var loginPresenter:LoginPresenterPrototolDelegate?
    
    init(dataManager:DataManagerProtocolDelegate) {
        self.dataManagerProtocol = dataManager
    }

}

extension LoginInteractor {
    
    func sendingDetailsToInteractor(_ name: String, password: String) {
        self.dataManagerProtocol.sendingDataDetails(name, password: password)
    }
    
    func gettingDataFromDatamanager(_ userModel: UserModel?) {
        self.presenter?.gettingDataFromInteractor(userModel)
    }
}
