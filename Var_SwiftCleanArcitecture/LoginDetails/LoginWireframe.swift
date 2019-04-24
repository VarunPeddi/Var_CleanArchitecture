//
//  LoginWireframe.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 23/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import UIKit

protocol LoginWireframeProtocolDelegate:class {
    func pushToListViewController(_ viewProtocol:LoginViewControllerProtocolDelegate, userModel:UserModel)
}

class LoginWireframe: NSObject,LoginWireframeProtocolDelegate {
    
    func pushToListViewController(_ viewProtocol: LoginViewControllerProtocolDelegate, userModel: UserModel) {
        var dataManager:DataManagerProtocolDelegate = DataManager()
        let webServiceManager:APIClient = WebServiceManager()
        let worker:ListWorkersProtocolDelegate = ListWorkers(serviceManager: webServiceManager)
        let interactor:ListInteractorProtocolDelegate = ListInteractor(dataManager: dataManager, worker: worker)
        let wireframe:ListWireframeProtocolDelegate = ListWireframe()
        let presenter:ListPresenterProtocolDelegate = ListPresenter(interactor: interactor, wireframe: wireframe, userModel: userModel)
        let listVc:ListDetailsViewProtocolDelegate = ListDetailsViewController(presenter: presenter,interactor:interactor)
        
        interactor.listPresenter = presenter
        presenter.listViewControllerProtocol = listVc
        dataManager.listInteractor = interactor
        
        if let view = viewProtocol as? UIViewController, let lVc = listVc as? ListDetailsViewController {
            view.navigationController?.pushViewController(lVc, animated: true)
        }
        print("nextVc")
    }
}
