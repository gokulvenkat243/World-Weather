//
//  UserListViewController.swift
//  WorldWether
//
//  Created by gokul v on 24/07/24.
//

import UIKit

class UserListViewController: UIViewController {
    
    var viewModel: UserListViewModel
    
    init(viewModel: UserListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let searchController: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.selectedScopeButtonIndex = 0
        search.translatesAutoresizingMaskIntoConstraints = false
        search.searchBarStyle = .minimal
        return search
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UserListTableViewCell.self, forCellReuseIdentifier: UserListTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.userData = viewModel.fetchUser()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        view.addSubview(searchController)
        tableView.delegate = self
        tableView.dataSource = self
        searchController.delegate = self
        constraints()
    }
    
    private func constraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            searchController.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            searchController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchController.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchController.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserListTableViewCell.identifier, for: indexPath) as? UserListTableViewCell else {
            return UITableViewCell()
        }
        let userName = viewModel.userData[indexPath.row]
        cell.textLabel?.text = userName.firstName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.userListToDetailsPage(data: viewModel.userData[indexPath.row].firstName ?? "error")
    }
}

extension UserListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchUserName(searchText: searchText)
        self.tableView.reloadData()
    }
}

