//
//  ListPresenter.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 23/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import UIKit

protocol ListPresenterProtocolDelegate:class {
    var userModel:UserModel? { get set }
    var listViewControllerProtocol:ListDetailsViewProtocolDelegate? { get set }
    
    func gettingResponseFromServer(_ dataModel:[ListDataModel])
}

class ListPresenter: NSObject,ListPresenterProtocolDelegate {
    var listViewControllerProtocol: ListDetailsViewProtocolDelegate?
    
    var userModel: UserModel?
    var listLiteractorProtocol:ListInteractorProtocolDelegate?
    var listWireFreme:ListWireframeProtocolDelegate?
    
    
    init(interactor:ListInteractorProtocolDelegate, wireframe:ListWireframeProtocolDelegate, userModel:UserModel) {
        self.listLiteractorProtocol = interactor
        self.listWireFreme = wireframe
        self.userModel = userModel
    }

}

extension ListPresenter {
    
    func gettingResponseFromServer(_ dataModel: [ListDataModel]) {
        self.listViewControllerProtocol?.receiveResponseDataFromServer(dataModel)
    }
}
