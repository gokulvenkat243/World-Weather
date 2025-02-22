//
//  SignUpPageViewController.swift
//  WorldWether
//
//  Created by gokul v on 24/07/24.
//

import UIKit

class SignUpPageViewController: UIViewController {
    
    let viewModel: SignUpViewModel
    
    init(viewModel: SignUpViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let datePicker = UIDatePicker()
    
    private let signUpScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let SignUpContentView: UIView = {
        let cView = UIView()
        cView.translatesAutoresizingMaskIntoConstraints = false
        return cView
    }()
    
    private let TitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstNameTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "First Name"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lastNameTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Last Name"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneNoTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dobTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Data of Birth"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let genderTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Gender"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let maleTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Male"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let femaleTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Female"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightText
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 0.2
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 45))
        text.leftViewMode = .always
        text.addTarget(nil, action: #selector(textFieldShouldReturn), for: .touchUpInside)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let firstNameTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightText
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 0.2
        text.leftViewMode = .always
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 45))
        text.translatesAutoresizingMaskIntoConstraints = false
        text.addTarget(nil, action: #selector(textFieldShouldReturn), for: .touchUpInside)
        return text
    }()
    
    private let lastNameTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightText
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 0.2
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 45))
        text.leftViewMode = .always
        text.addTarget(nil, action: #selector(textFieldShouldReturn), for: .touchUpInside)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let phoneNoTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightText
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 0.2
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 45))
        text.leftViewMode = .always
        text.addTarget(nil, action: #selector(textFieldShouldReturn), for: .touchUpInside)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let addressTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightText
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 0.2
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 45))
        text.leftViewMode = .always
        text.addTarget(nil, action: #selector(textFieldShouldReturn), for: .touchUpInside)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.backgroundColor = .lightText
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 0.2
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 45))
        text.leftViewMode = .always
        text.addTarget(nil, action: #selector(textFieldShouldReturn), for: .touchUpInside)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let dobTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "DD-MM-YYYY"
        text.backgroundColor = .lightText
        text.layer.masksToBounds = true
        text.layer.cornerRadius = 8
        text.layer.borderWidth = 0.2
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 45))
        text.leftViewMode = .always
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let maleOnOfButtton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "circle.inset.filled"), for: .selected)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20/2
        button.backgroundColor = .systemBackground
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(radioButtonTap), for: .touchUpInside)
        return button
    }()
    
    private let femaleOnOfButtton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.setImage(UIImage(systemName: "circle.inset.filled"), for: .selected)
        button.contentMode = .scaleAspectFill
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20/2
        button.tintColor = .label
        button.backgroundColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(radioButtonTap), for: .touchUpInside)
        return button
    }()
    
    private let submitButtton: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.contentMode = .scaleAspectFill
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(submitButtonTap), for: .touchUpInside)
        return button
    }()
    
    @objc func textFieldShouldReturn(_ text: UITextField) -> Bool {
        text.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(signUpScrollView)
        signUpScrollView.addSubview(SignUpContentView)
        SignUpContentView.addSubview(TitleLabel)
        SignUpContentView.addSubview(emailTitleLabel)
        SignUpContentView.addSubview(firstNameTitleLabel)
        SignUpContentView.addSubview(lastNameTitleLabel)
        SignUpContentView.addSubview(addressTitleLabel)
        SignUpContentView.addSubview(phoneNoTitleLabel)
        SignUpContentView.addSubview(passwordTitleLabel)
        SignUpContentView.addSubview(dobTitleLabel)
        SignUpContentView.addSubview(genderTitleLabel)
        SignUpContentView.addSubview(maleTitleLabel)
        SignUpContentView.addSubview(femaleTitleLabel)
        
        SignUpContentView.addSubview(emailTextField)
        SignUpContentView.addSubview(firstNameTextField)
        SignUpContentView.addSubview(lastNameTextField)
        SignUpContentView.addSubview(phoneNoTextField)
        SignUpContentView.addSubview(addressTextField)
        SignUpContentView.addSubview(passwordTextField)
        SignUpContentView.addSubview(dobTextField)
        SignUpContentView.addSubview(maleOnOfButtton)
        SignUpContentView.addSubview(femaleOnOfButtton)
        SignUpContentView.addSubview(submitButtton)
        constraints()
        dobDatePicker()
    }
    
    private func dobDatePicker() {
        let tool = UIToolbar()
        tool.sizeToFit()
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        tool.setItems([done, cancel], animated: true)
        dobTextField.inputAccessoryView = tool
        dobTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.preferredDatePickerStyle = .inline
        
    }
    
    private func constraints() {
        NSLayoutConstraint.activate([
            signUpScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            signUpScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            signUpScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            signUpScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            SignUpContentView.topAnchor.constraint(equalTo: signUpScrollView.contentLayoutGuide.topAnchor),
            SignUpContentView.leadingAnchor.constraint(equalTo: signUpScrollView.contentLayoutGuide.leadingAnchor),
            SignUpContentView.trailingAnchor.constraint(equalTo: signUpScrollView.contentLayoutGuide.trailingAnchor),
            SignUpContentView.bottomAnchor.constraint(equalTo: signUpScrollView.contentLayoutGuide.bottomAnchor),
            //vertical scrolling
            SignUpContentView.leadingAnchor.constraint(equalTo: signUpScrollView.frameLayoutGuide.leadingAnchor),
            SignUpContentView.trailingAnchor.constraint(equalTo: signUpScrollView.frameLayoutGuide.trailingAnchor),
            SignUpContentView.heightAnchor.constraint(equalToConstant: 800)
        ])
        
        NSLayoutConstraint.activate([
            TitleLabel.topAnchor.constraint(equalTo: SignUpContentView.topAnchor),
            TitleLabel.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 100),
            TitleLabel.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -100),
        ])
        
        NSLayoutConstraint.activate([
            emailTitleLabel.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 20),
            emailTitleLabel.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            emailTitleLabel.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -240),
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailTitleLabel.bottomAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            emailTextField.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -40),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            firstNameTitleLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            firstNameTitleLabel.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            firstNameTitleLabel.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -240),
        ])
        
        NSLayoutConstraint.activate([
            firstNameTextField.topAnchor.constraint(equalTo: firstNameTitleLabel.bottomAnchor, constant: 5),
            firstNameTextField.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            firstNameTextField.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -40),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            lastNameTitleLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 20),
            lastNameTitleLabel.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            lastNameTitleLabel.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -240),
        ])
        
        NSLayoutConstraint.activate([
            lastNameTextField.topAnchor.constraint(equalTo: lastNameTitleLabel.bottomAnchor, constant: 5),
            lastNameTextField.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            lastNameTextField.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -40),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            phoneNoTitleLabel.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 20),
            phoneNoTitleLabel.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            phoneNoTitleLabel.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -100),
        ])
        
        NSLayoutConstraint.activate([
            phoneNoTextField.topAnchor.constraint(equalTo: phoneNoTitleLabel.bottomAnchor, constant: 5),
            phoneNoTextField.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            phoneNoTextField.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -40),
            phoneNoTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            addressTitleLabel.topAnchor.constraint(equalTo: phoneNoTextField.bottomAnchor, constant: 20),
            addressTitleLabel.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            addressTitleLabel.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -100),
        ])
        
        NSLayoutConstraint.activate([
            addressTextField.topAnchor.constraint(equalTo: addressTitleLabel.bottomAnchor, constant: 5),
            addressTextField.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            addressTextField.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -40),
            addressTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            passwordTitleLabel.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: 20),
            passwordTitleLabel.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            passwordTitleLabel.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -100),
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordTitleLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            dobTitleLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            dobTitleLabel.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            dobTitleLabel.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -100),
        ])
        
        NSLayoutConstraint.activate([
            dobTextField.topAnchor.constraint(equalTo: dobTitleLabel.bottomAnchor, constant: 5),
            dobTextField.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            dobTextField.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -40),
            dobTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            genderTitleLabel.topAnchor.constraint(equalTo: dobTextField.bottomAnchor, constant: 20),
            genderTitleLabel.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 40),
            genderTitleLabel.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -240),
        ])
        
        NSLayoutConstraint.activate([
            maleTitleLabel.topAnchor.constraint(equalTo: genderTitleLabel.bottomAnchor, constant: 15),
            maleTitleLabel.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 130),
            maleTitleLabel.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -220),
        ])
        
        NSLayoutConstraint.activate([
            femaleTitleLabel.topAnchor.constraint(equalTo: genderTitleLabel.bottomAnchor, constant: 15),
            femaleTitleLabel.leadingAnchor.constraint(equalTo: maleTitleLabel.trailingAnchor, constant: 80),
            femaleTitleLabel.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -80),
        ])
        
        NSLayoutConstraint.activate([
            maleOnOfButtton.topAnchor.constraint(equalTo: genderTitleLabel.bottomAnchor, constant: 15),
            maleOnOfButtton.trailingAnchor.constraint(equalTo: maleTitleLabel.leadingAnchor, constant: -10),
            maleOnOfButtton.heightAnchor.constraint(equalToConstant: 20),
            maleOnOfButtton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            femaleOnOfButtton.topAnchor.constraint(equalTo: genderTitleLabel.bottomAnchor, constant: 15),
            femaleOnOfButtton.trailingAnchor.constraint(equalTo: femaleTitleLabel.leadingAnchor, constant: -10),
            femaleOnOfButtton.heightAnchor.constraint(equalToConstant: 20),
            femaleOnOfButtton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            submitButtton.topAnchor.constraint(equalTo: femaleOnOfButtton.bottomAnchor, constant: 40),
            submitButtton.leadingAnchor.constraint(equalTo: SignUpContentView.leadingAnchor, constant: 100),
            submitButtton.trailingAnchor.constraint(equalTo: SignUpContentView.trailingAnchor, constant: -100),
            submitButtton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func submitButtonTap() {
        guard let email = emailTextField.text, !email.isEmpty else {
            alertMessage(message: "Enter Email")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            alertMessage(message: "Enter Password")
            return
        }
        
        guard let firstName = firstNameTextField.text, !firstName.isEmpty else {
            alertMessage(message: "Enter First Name")
            return
        }
        
        guard let lastName = lastNameTextField.text, !lastName.isEmpty else {
            alertMessage(message: "Enter Last Name")
            return
        }
        
        guard let phoneNumber = phoneNoTextField.text, !phoneNumber.isEmpty else {
            alertMessage(message: "Enter Phone Number")
            return
        }
        
        guard let address = addressTextField.text, !address.isEmpty else {
            alertMessage(message: "Enter Your Address")
            return
        }
        
        guard let dob = dobTextField.text, !dob.isEmpty else {
            alertMessage(message: "Enter Your DOB")
            return
        }
        
        let user = Model(firstName: firstName,
                         lastName: lastName,
                         password: password,
                         dob: dob,
                         address: address,
                         phoneNumber: phoneNumber,
                         email: email, gender: "gender")
        viewModel.addUser(user)
        viewModel.tapToSubmitUserSignUpDetails()
    }
    
    private func alertMessage(message: String) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let Ok = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(Ok)
        present(alertController, animated: true)
    }
    
    @objc func radioButtonTap(in sender: UIButton) {
        
        if sender == maleOnOfButtton {
            maleOnOfButtton.isSelected = true
            femaleOnOfButtton.isSelected = false
        } else {
            femaleOnOfButtton.isSelected = true
            maleOnOfButtton.isSelected = false
        }
    }
    
    @objc func done() {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .none
        dobTextField.text = formater.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func cancel() {
        view.endEditing(true)
    }
}
