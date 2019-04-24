//
//  ListDetailsViewController.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 23/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import UIKit

protocol ListDetailsViewProtocolDelegate:class {
    func receiveResponseDataFromServer(_ dataModel:[ListDataModel])
}

class ListDetailsViewController: UIViewController {

    
    var listPresenter:ListPresenterProtocolDelegate?
    
    var listInteractor:ListInteractorProtocolDelegate?
    
    let loginLbl:UILabel
    
    let listTableView:UITableView
    
    var listArrModel = [ListDataModel]()
    
    init(presenter:ListPresenterProtocolDelegate, interactor:ListInteractorProtocolDelegate) {
        self.listPresenter = presenter
        self.listInteractor = interactor
        self.loginLbl = UILabel()
        self.loginLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.listTableView = UITableView()
        self.listTableView.translatesAutoresizingMaskIntoConstraints = false
        self.listTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
 
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        //self.view.addSubview(loginLbl)
        self.view.addSubview(listTableView)
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        //loginLbl.text = "On-Boarding"
        
        listTableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        listTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        listTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        listTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchListFromServer()
    }
    
    private func fetchListFromServer() {
        self.listInteractor?.fetchRequestFromServer()
    }

}

extension ListDetailsViewController:ListDetailsViewProtocolDelegate {
    func receiveResponseDataFromServer(_ dataModel: [ListDataModel]) {
        self.listArrModel = dataModel
        self.listTableView.reloadData()
    }
}

// MARK: - Extension UITableViewDelegate
extension ListDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard tableView.cellForRow(at: indexPath) != nil else {
            return
        }
        //        router?.routeToDetails()
    }
}


// MARK: - Extension UITableViewDataSource
extension ListDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArrModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "MyCell")
        }
        cell?.textLabel?.text = listArrModel[indexPath.item].optionsDetails
        
        return cell!
    }
}

