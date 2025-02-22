//
//  UserDetailsViewController.swift
//  WorldWether
//
//  Created by gokul v on 25/07/24.
//

import UIKit
import CoreData

class UserDetailsViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    let viewModel: UserDetailsViewModel
    
    init(viewModel: UserDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "User Details"
        label.textAlignment = .center
        label.textColor = .orange
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lastNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emaiLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let phoneNoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let dobLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(firstNameLabel)
        view.addSubview(lastNameLabel)
        view.addSubview(emaiLabel)
        view.addSubview(passwordLabel)
        view.addSubview(phoneNoLabel)
        view.addSubview(dobLabel)
        view.addSubview(addressLabel)
        constraints()
        fetchUserName()
    }
    
    private func fetchUserName() {
        viewModel.fetchUserDetails()
        firstNameLabel.text = "First Name: \(viewModel.userData.first?.firstName ?? "Error")"
        lastNameLabel.text = "Last Name: \(viewModel.userData.first?.lastName ?? "Error")"
        emaiLabel.text = "Email: \(viewModel.userData.first?.email ?? "Error")"
        passwordLabel.text = "Password: \(viewModel.userData.first?.password ?? "Error")"
        phoneNoLabel.text = "Phone Number: \(viewModel.userData.first?.phoneNumber ?? "Error")"
        dobLabel.text = "DOB: \(viewModel.userData.first?.dob ?? "Error")"
        addressLabel.text = "Address: \(viewModel.userData.first?.address ?? "Error")"
    }
    
    private func constraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            firstNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            firstNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        ])
        
        NSLayoutConstraint.activate([
            lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 15),
            lastNameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        ])
        
        NSLayoutConstraint.activate([
            emaiLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 15),
            emaiLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        ])
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emaiLabel.bottomAnchor, constant: 15),
            passwordLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        ])
        
        NSLayoutConstraint.activate([
            phoneNoLabel.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 15),
            phoneNoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        ])
        
        NSLayoutConstraint.activate([
            dobLabel.topAnchor.constraint(equalTo: phoneNoLabel.bottomAnchor, constant: 15),
            dobLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        ])
        
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: dobLabel.bottomAnchor, constant: 15),
            addressLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
        ])
    }
}

