//
//  LoginPresenter.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 23/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import UIKit


protocol LoginPresenterPrototolDelegate:class {
    var loginViewDelegate:LoginViewControllerProtocolDelegate? { get set }
    var userModel:UserModel? { get set }
    func sendingDataToIntractor(_ name:String, password:String)
    func gettingDataFromInteractor(_ dataModel:UserModel?)
    func pushToNewViewController()
}


class LoginPresenter: LoginPresenterPrototolDelegate {
    
    var userModel: UserModel?

   weak var loginViewDelegate: LoginViewControllerProtocolDelegate?
    
    weak var presenterDelegate:LoginPresenterPrototolDelegate?
    
    // Initial the interactor to send data
    let interactor:LoginInteractorProtocolDelagate
    
    // Initializing the routor to go to new view controller
    let loginWireframe:LoginWireframeProtocolDelegate

    init(interactor:LoginInteractorProtocolDelagate, wireframe:LoginWireframeProtocolDelegate) {
        self.interactor = interactor
        self.loginWireframe = wireframe
    }
}


extension LoginPresenter {
    
    func sendingDataToIntractor(_ name: String, password: String) {
        // can show the loader details here
        // send the login details to the interactor
        self.interactor.sendingDetailsToInteractor(name, password: password)
    }
    
    func gettingDataFromInteractor(_ dataModel: UserModel?) {
       // can hide the loader since the response received successfully
        self.userModel = dataModel
        if let user = dataModel {
            self.loginViewDelegate?.receivedDataFromPresenterSuccess(LoginViewModel.init(userModel: user, successTitle: "Success", successMessage: "Login Successfully"))
        } else {
            self.loginViewDelegate?.receivedErrorMessage("Failed to get user object")
        }
    }
    
    func pushToNewViewController() {
        if let userData = userModel {
        self.loginWireframe.pushToListViewController(loginViewDelegate!, userModel: userData)
        }
    }
}
