//
//  LoginViewController.swift
//  GalleryApp
//
//  Created by Deepak Agrawal on 29/12/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
        if let usernameData = KeyChain.load(key: "Username") {
            let username = String(decoding: usernameData, as: UTF8.self)
            self.userNameTextField.text = username
        }
        
        if let passwordData = KeyChain.load(key: "Password") {
            let password = String(decoding: passwordData, as: UTF8.self)
            self.passwordTextField.text = password
        }
    }
    
    
    
    @IBAction func LoginButtonClicked(_ sender: UIButton) {
        
        if !(self.userNameTextField.text == "") && !(self.passwordTextField.text == "") {
            self.saveUsernamePasswordInKeychain(username: self.userNameTextField.text!, password: self.passwordTextField.text!)
        }
        self.performSegue(withIdentifier: "homeSegue", sender: self)
        
    }
    
    
    func saveUsernamePasswordInKeychain(username:String, password:String){
        
        let usernameData = Data(username.utf8)
        let _ = KeyChain.save(key: "Username", data: usernameData)
        
        let passwordData = Data(password.utf8)
        let _ = KeyChain.save(key: "Password", data: passwordData)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
