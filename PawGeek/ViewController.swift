//
//  ViewController.swift
//  PawGeek
//
//  Created by Ueto Utamuro on 7/3/17.
//  Copyright © 2017 Ueto Utamuro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var signUpview_NameTField: UITextField!
    @IBOutlet weak var signUpview_EmailTField: UITextField!
    @IBOutlet weak var signUpview_PhoneTField: UITextField!
    @IBOutlet weak var signUpview_ZipTField: UITextField!
    @IBOutlet weak var signInview_EmailTField: UITextField!
    @IBOutlet weak var signInview_PasswordTField: UITextField!
    
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signInView.isHidden=true
        self.signUpView.isHidden=true
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Move up the UIView when edit UITextField
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height/2
            }
        }
    }
    
    @IBAction func signInBtnClicked(_ sender: UIButton) {
        self.signUpView.isHidden=true
        self.signInView.isHidden=false
        
    }

    @IBAction func signUpBtnClicked(_ sender: UIButton) {
        self.signUpView.isHidden=false
        self.signInView.isHidden=true
        
    }
    @IBAction func signUpView_SignInBtnClicked(_ sender: UIButton) {
        self.signInView.isHidden=false
        self.signUpView.isHidden=true
        
    }

    @IBAction func signUpView_RegistorBtnClicked(_ sender: UIButton) {
        if (self.signUpview_NameTField.text == "" && self.signUpview_EmailTField.text == "" && self.signUpview_PhoneTField.text == "" && self.signUpview_ZipTField.text == "") {
            let alert = UIAlertController(title: "Error", message: "Empty. Please enter your name, email, password and Zip code.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    @IBAction func signInview_SignUpBtnClicked(_ sender: UIButton) {
        self.signInView.isHidden=true
        self.signUpView.isHidden=false
        
    }
    @IBAction func signInView_SignInBtnClicked(_ sender: UIButton) {
        if (self.signInview_EmailTField.text == "" && self.signInview_PasswordTField.text == "" ){
            let alert = UIAlertController(title: "Error", message: "Empty. Please enter email and password.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let viewController =  self.storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

// Hide the keyboard when touch the screen
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
