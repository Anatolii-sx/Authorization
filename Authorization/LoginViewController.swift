//
//  LoginViewController.swift
//  Authorization
//
//  Created by Анатолий Миронов on 23.08.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let login = "admin"
    let password = "admin123"
    
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
    
    // Hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.userName = userNameTF.text
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text = nil
        passwordTF.text = nil
    }
    
    @IBAction func logInButtonTapped() {
        guard let userName = userNameTF.text, !userName.isEmpty,
              let password = passwordTF.text, !password.isEmpty
        else {
            showAlert(title: "Warning", message: "The field of user name or password is empty")
            return
        }
        
        if userName == login && password == password {
            performSegue(
                withIdentifier: "segueFromLoginVCToWelcomeVC",
                sender: nil
            )
        } else {
            passwordTF.text = nil
            showAlert(title: "Warning", message: "Wrong user name or password")
        }
    }
    
    @IBAction func forgotUserNameButtonTapped() {
        showAlert(title: "Help", message: "Your username: \(login)")
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(title: "Help", message: "Your password: \(password)")
    }
    
    // Change focus in fields
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            logInButtonTapped()
        }
        
        return true
    }
    
    // Alert
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
