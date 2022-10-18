//
//  SecondViewController.swift
//  SIUUUU
//
//  Created by Farhandika on 18/25/22.
//

import UIKit
import ReSwift

final class SecondViewController: BaseViewController, StoreSubscriber  {
    func newState(state: UserState) {
        guard let user = state.user else { return }
        self.selectedLabel.text = "\(user.firstName) \(user.lastName)"
    }
    
    typealias StoreSubscriberStateType = UserState
    
    static func create(name: String = "") -> SecondViewController {
        let vc = SecondViewController()
        vc.nameLabel.text = name
        return vc
    }
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    private lazy var selectedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 24)
        label.text = "Select username"
        return label
    }()
    private lazy var chooseButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Choose a User", for: .normal)
        btn.backgroundColor = UIColor(named: "baseBtnColor")
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(didTapSelectUser), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        return btn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second Screen"
        userStore.subscribe(self)
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(welcomeLabel)
        view.addSubview(selectedLabel)
        view.addSubview(chooseButton)
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            
            selectedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            selectedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            chooseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            chooseButton.heightAnchor.constraint(equalToConstant: 50),
            chooseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseButton.trailingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor),
            chooseButton.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
        ])
    }
    
    deinit {
        userStore.unsubscribe(self)
    }
    
    @objc
    func didTapSelectUser() {
        let vc = ThirdViewController.create()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
