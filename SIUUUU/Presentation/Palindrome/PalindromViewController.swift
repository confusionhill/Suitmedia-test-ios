//
//  PalindromViewController.swift
//  SIUUUU
//
//  Created by Farhandika on 18/10/22.
//

import UIKit

final class PalindromViewController: UIViewController {
    public static func create() -> PalindromViewController {
        let vc = PalindromViewController(nibName: "PalindromViewController", bundle: nil)
        return vc
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var palindromTextField: UITextField!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    lazy var alertView: UIAlertController = {
        let view = UIAlertController(title: "memes", message: "wadidaw", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .cancel) { aksi in
            view.dismiss(animated: true)
        }
        view.addAction(action)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.layer.cornerRadius = 10
        nameTextField.setLeftPaddingPoints(20)
        nameTextField.setRightPaddingPoints(20)
        palindromTextField.layer.cornerRadius = 10
        palindromTextField.setLeftPaddingPoints(20)
        palindromTextField.setRightPaddingPoints(20)
        
        container.layer.cornerRadius = container.frame.width/2
        container.layer.masksToBounds = true
        container.backgroundColor = .white.withAlphaComponent(0.3)
        
        checkButton.layer.cornerRadius = 10
        nextButton.layer.cornerRadius = 10
    }
    
    @IBAction func didTapCheck(_ btn: UIButton) {
        isPalindrome()
    }
    @IBAction func didTapNext() {
        guard
            let name = nameTextField.text,
            name != ""
        else {
            alertView.title = "Username not in the text box"
            alertView.message = "You have not inputed any username"
            self.present(alertView, animated: true)
            return
        }
        let vc = SecondViewController.create(name: nameTextField.text ?? "")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func isPalindrome() {
        guard
            let inputString: String = palindromTextField.text,
            inputString != ""
        else {
            alertView.title = "Not Palindrom"
            alertView.message = "The input given is not a palindrom sequence"
            self.present(alertView, animated: true)
            return
        }
        let stringLength = inputString.count
        var position = 0
        
        while position < stringLength / 2 {
            let startIndex = inputString.index(inputString.startIndex, offsetBy: position)
            let endIndex = inputString.index(inputString.endIndex, offsetBy: -position - 1)
            
            if inputString[startIndex] == inputString[endIndex] {
                position += 1
            } else {
                alertView.title = "Not Palindrom"
                alertView.message = "The input given is not a palindrom sequence"
                self.present(alertView, animated: true)
                return
            }
        }
        alertView.title = "Is Palindrom"
        alertView.message = "The input given is a palindrom sequence"
        self.present(alertView, animated: true)
        return
    }
}
