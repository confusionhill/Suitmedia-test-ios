//
//  ThirdViewController.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import UIKit
import ReSwift

final class ThirdViewController: BaseViewController, StoreSubscriber {
    func newState(state: UserState) {}
    
    typealias StoreSubscriberStateType = UserState
    
    static func create() -> ThirdViewController {
        let vc = ThirdViewController()
        return vc
    }
    
    let refreshControl = UIRefreshControl()
    public var viewModel: ThirdViewModelInput = ThirdViewModel()
    lazy var tableView: UITableView = {
        let tbv = UITableView(
            frame: UIScreen.main.bounds,
            style: .plain)
        tbv.delegate = self
        tbv.dataSource = self
        ThirdTableViewCell.register(tableView: tbv)
        return tbv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewOutput = self
        userStore.subscribe(self)
        viewModel.viewDidLoad()
    }
    
    deinit {
        userStore.unsubscribe(self)
    }
    
    @objc
    func didPerformRefresh() {
        viewModel.refreshUsers()
    }
}

extension ThirdViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.users[indexPath.row]
        userStore.dispatch(UserAction.add(user: user))
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if viewModel.isPaginable(idxPath: indexPath) {
            viewModel.getUsers()
        }
    }
}

extension ThirdViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ThirdTableViewCell.identify, for: indexPath) as! ThirdTableViewCell
        let vm = ThirdTableViewCell.TBVViewModel()
        let data = viewModel.users[indexPath.row]
        vm.name = "\(data.firstName) \(data.lastName)"
        vm.email = data.email
        vm.image = data.avatar
        cell.configure(viewModel: vm)
        return cell
    }
}

extension ThirdViewController: ThirdViewModelOutput {
    func setupView() {
        self.title = "Third Screen"
        view.backgroundColor = .white
        view.addSubview(tableView)
        refreshControl.addTarget(self, action: #selector(didPerformRefresh), for: .valueChanged)
        tableView.refreshControl = self.refreshControl
    }
    func doneGettingUsers() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }
    }
    func failGettingUsers() {
        refreshControl.endRefreshing()
        if viewModel.currPage == 1 {
            let view = UIAlertController(title: "Cannot Load Data", message: "Looks like there's a problem", preferredStyle: .alert)
            let action = UIAlertAction(title: "Done", style: .cancel) { aksi in
                view.dismiss(animated: true)
                self.navigationController?.popViewController(animated: true)
            }
            view.addAction(action)
            self.present(view, animated: true)
        }
    }
}
