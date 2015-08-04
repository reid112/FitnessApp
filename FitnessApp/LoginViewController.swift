//
//  LoginViewController.swift
//  FitnessApp
//
//  Created by Riley Reid on 2015-07-29.
//  Copyright (c) 2015 RJReid. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    @IBOutlet weak var DontSignIn: UIButton!
    
    @IBAction func DontSignInClicked(sender: UIButton) {
        ShowHomeOrSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            // User is logged in
            
            ShowHomeOrSetup()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if (error != nil) {
            // error logging in: show some error message to the user that login failed (popup?)
            
            println(error.localizedDescription)
            return
        }
        
        if let userToken = result.token {
            // log in was successful
            
            ShowHomeOrSetup()
        }
        
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        // user should never log out from here
    }
    
    func ShowHomeOrSetup() {
        
        // if not setup, go to setup, otherwise, go to home
        
        if (true) {
            // Go To Setup

            performSegueWithIdentifier("goToSetup", sender: nil)
        } else {
            // Go To Home
            
            var main = self.storyboard?.instantiateViewControllerWithIdentifier("mainView") as! SWRevealViewController
            self.presentViewController(main, animated: false, completion: nil)
        }
    }

    
    
    
}
