//
//  LoginViewController.swift
//  Authorization
//
//  Created by Анатолий Миронов on 23.08.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
        
        passwordTF.enablesReturnKeyAutomatically = true
    }
    
    @IBAction func logInButtonTapped() {
        guard let userName = userNameTF.text, !userName.isEmpty,
              let password = passwordTF.text, !password.isEmpty
        else {
            showAlert(title: "Warning", message: "The field of user name or password is empty")
            return
        }
        
        if userName == "admin" && password == "admin123" {
            performSegue(
                withIdentifier: "segueFromLoginVCToWelcomeVC",
                sender: nil
            )
        } else {
            showAlert(title: "Warning", message: "Wrong user name or password")
        }
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        showAlert(title: "Help", message: "Your username: admin")
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(title: "Help", message: "Your password: admin123")
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text = nil
        passwordTF.text = nil
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.userName = userNameTF.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            logInButtonTapped()
        }
        
        return true
    }
    
    // Hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        present(alert, animated: true)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okButton)
    }
}
