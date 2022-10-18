//
//  BaseViewController.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = UIColor(red: 0.33, green: 0.29, blue: 0.94, alpha: 1.00)
        self.navigationItem.setHidesBackButton(true, animated: true)
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(didTapBackButton))
        self.navigationItem.leftBarButtonItem = backButton
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc
    func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
