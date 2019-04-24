//
//  ListInteractor.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 23/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import UIKit

protocol ListInteractorProtocolDelegate:class {
    var listPresenter:ListPresenterProtocolDelegate? { get set }
    
    func fetchRequestFromServer()
}

class ListInteractor: NSObject,ListInteractorProtocolDelegate {
    
    var listPresenter: ListPresenterProtocolDelegate?
    
     var dataManagerProtocol:DataManagerProtocolDelegate?
    var listWorker:ListWorkersProtocolDelegate?
    
    init(dataManager:DataManagerProtocolDelegate, worker:ListWorkersProtocolDelegate) {
        self.dataManagerProtocol = dataManager
        self.listWorker = worker
    }
}


extension ListInteractor {
    
    func fetchRequestFromServer() {
        listWorker?.callRequestApi(completionHandler: { (response) in
            let listArrModel = ListDataModel.parsingResponseFromServer(response)
            print(listArrModel.count)
            self.listPresenter?.gettingResponseFromServer(listArrModel)
        })
    }
}
