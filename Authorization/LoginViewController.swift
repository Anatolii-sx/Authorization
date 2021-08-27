//
//  LoginViewController.swift
//  Authorization
//
//  Created by Анатолий Миронов on 23.08.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    // MARK: - Private properties
    private let login = "admin"
    private let password = "admin123"
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
        userNameTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
        
        passwordTF.enablesReturnKeyAutomatically = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.userName = userNameTF.text
    }
    
    // Hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction func logInButtonTapped() {
        if userNameTF.text != login || passwordTF.text != password {
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
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTF.text = nil
        passwordTF.text = nil
    }
    
    // MARK: - Public methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            logInButtonTapped()
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
        
        return true
    }
    
    // MARK: - Private methods
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
