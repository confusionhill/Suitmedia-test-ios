//
//  Coordinator.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
}

final class RootCoordinator: Coordinator {
    public static let shared = RootCoordinator()
    var window:UIWindow?
    private(set) var navigationController: UINavigationController = UINavigationController()
    public func start() {
        let vc = PalindromViewController.create()
        self.navigationController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
