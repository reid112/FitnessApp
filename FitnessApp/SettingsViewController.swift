//
//  SettingsViewController.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-07-28.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

class SettingsViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var logoutButton: FBSDKLoginButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = Selector("revealToggle:")
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            // User is logged in with facebook, so show the facebook logout button
            
            logoutButton.delegate = self
        } else {
            // hide facebook button
            logoutButton.hidden = true
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        // user should never log in from here
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        let loginView = self.storyboard?.instantiateViewControllerWithIdentifier("LoginView") as! LoginViewController
        let loginViewNav = UINavigationController(rootViewController: loginView)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = loginViewNav
    }

    
    
    
    
    
    
}