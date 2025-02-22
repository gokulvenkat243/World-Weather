//
//  ViewController.swift
//  WorldWether
//
//  Created by gokul v on 24/07/24.
//

import UIKit
import CoreLocation

class LoginPageViewController: UIViewController {
    
    let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let scrollView: UIScrollView = {
        let sc = UIScrollView()
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    private let contentView: UIView = {
        let cView = UIView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sign")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .bold)
        return label
    }()
    
    private let emailTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "E-mail"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightText
        text.textColor = .black
        text.layer.masksToBounds = true
        text.textAlignment = .center
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 0.2
        text.leftViewMode = .always
        text.addTarget(nil, action: #selector(textFieldShouldReturn), for: .touchUpInside)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let PasswordTextField: UITextField = {
        let text = UITextField()
        text.isSecureTextEntry = true
        text.backgroundColor = .lightText
        text.layer.masksToBounds = true
        text.textAlignment = .center
        text.textColor = .black
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 0.2
        text.leftViewMode = .always
        text.addTarget(nil, action: #selector(textFieldShouldReturn), for: .touchUpInside)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .systemTeal
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(loginBtnTap), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemTeal
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(SignUpTap), for: .touchUpInside)
        return button
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(welcomeLabel)
        contentView.addSubview(emailTitleLabel)
        contentView.addSubview(passwordTitleLabel)
        contentView.addSubview(emailTextField)
        contentView.addSubview(PasswordTextField)
        contentView.addSubview(loginButton)
        contentView.addSubview(signUpButton)
        contentView.addSubview(orLabel)
        constraints()
        viewModel.delegate = self
        
        viewModel.loggedUser()
    }
    
    func alertMessage(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    private func constraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            //vertical scrolling
            contentView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 800)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            welcomeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            emailTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150),
            emailTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            emailTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -240),
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            passwordTitleLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            passwordTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -240),
        ])
        
        NSLayoutConstraint.activate([
            PasswordTextField.topAnchor.constraint(equalTo: passwordTitleLabel.bottomAnchor, constant: 5),
            PasswordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            PasswordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            PasswordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: PasswordTextField.bottomAnchor, constant: 50),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -120),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            orLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30),
            orLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 180),
            orLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -185),
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 30),
            signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            signUpButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -120),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func textFieldShouldReturn(_ text: UITextField) -> Bool {
        text.resignFirstResponder()
        return true
    }
    
    @objc func SignUpTap() {
        viewModel.openSignUpPage()
    }
    
    @objc func loginBtnTap() {
        guard let email = emailTextField.text, !email.isEmpty else {
            alertMessage(message: "Email must not be Empty!")
            return
        }
        
        guard let password = PasswordTextField.text, !password.isEmpty else {
            alertMessage(message: "Password must not be Empty!")
            return
        }
        
        viewModel.authenticationManager(email: email, password: password) {
            
        }
    }
}

extension LoginPageViewController: AlertMessageDelegatae {
    
    func alertMessageDelegate(message: String) {
        alertMessage(message: message)
    }
}


