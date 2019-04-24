//
//  LoginViewController.swift
//  Var_SwiftCleanArcitecture
//
//  Created by Kumar, Peddi on 23/04/19.
//  Copyright © 2019 Kumar, Peddi. All rights reserved.
//

import UIKit

protocol LoginViewControllerProtocolDelegate:class {
    func receivedDataFromPresenterSuccess(_ dataModel:LoginViewModel)
    func receivedErrorMessage(_ error:String)
}


class LoginViewController: UIViewController {
    
    //MARK::- IBOutlet(s) & Variable(s)
    
    let loginButton: UIButton
    
    let userNameTf:UITextField
    let passwordTf:UITextField
    
    
    // Initialize Presenter
    let presenter: LoginPresenterPrototolDelegate

    init(presenter:LoginPresenterPrototolDelegate) {
        self.presenter = presenter
        self.loginButton = UIButton()
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.loginButton.setTitle("Login", for: .normal)
        
        self.userNameTf = UITextField()
        self.userNameTf.translatesAutoresizingMaskIntoConstraints = false
        self.userNameTf.backgroundColor = .white
        self.userNameTf.textAlignment = .center
        self.userNameTf.placeholder = "Username"
        self.userNameTf.text = "Varun"
        
        self.passwordTf = UITextField()
        self.passwordTf.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTf.backgroundColor = .white
        self.passwordTf.textAlignment = .center
        self.passwordTf.placeholder = "Password"
        self.passwordTf.text = "123456"
        
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(loginButton)
        
        self.view.addSubview(userNameTf)
        self.view.addSubview(passwordTf)
        
       self.loginButton.addTarget(self, action: #selector(loginBtnPsd), for: .touchUpInside)

        self.settingLoginButtonConstraints()
        self.settingUsernameTfConstraints()
        self.settingPasswordTfConstraints()
      
    }
    
    //MARK::- Private Method(s)
    private func settingLoginButtonConstraints() {
        self.loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.loginButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.loginButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func settingUsernameTfConstraints() {
        self.userNameTf.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        self.userNameTf.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        let width = self.view.frame.width - 40
        self.userNameTf.widthAnchor.constraint(equalToConstant: width).isActive = true
       self.userNameTf.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    private func settingPasswordTfConstraints() {
        self.passwordTf.topAnchor.constraint(equalTo: self.userNameTf.bottomAnchor, constant: 10).isActive = true
        self.passwordTf.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        let width = self.view.frame.width - 40
        self.passwordTf.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.passwordTf.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    @objc func loginBtnPsd() {
        self.presenter.sendingDataToIntractor(self.userNameTf.text ?? "", password: passwordTf.text ?? "")
    }
    
    //MARK::- Login Router To Send To Another Controller
    private func goToNextScreen() {
        self.presenter.pushToNewViewController()
    }
}

extension LoginViewController: LoginViewControllerProtocolDelegate {
    func receivedDataFromPresenterSuccess(_ dataModel: LoginViewModel) {
       // let alert = UIAlertController(title: "Success", message: "Login Successfully", preferredStyle: .alert)
      //  alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      //  self.present(alert, animated: true)
       // let when = DispatchTime.now() + 1
       // DispatchQueue.main.asyncAfter(deadline: when) {
            self.goToNextScreen()
       // }
        
    }
    
    func receivedErrorMessage(_ error: String) {
        let alert = UIAlertController(title: "Failuer", message: "Login Failure", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)    }
}
