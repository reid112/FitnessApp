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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            // User is logged in
            
            var main = self.storyboard?.instantiateViewControllerWithIdentifier("mainView") as! SWRevealViewController
            self.presentViewController(main, animated: false, completion: nil)
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
            
            var main = self.storyboard?.instantiateViewControllerWithIdentifier("mainView") as! SWRevealViewController
            self.presentViewController(main, animated: false, completion: nil)
        }
        
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        // user should never log out from here
    }
    

    @IBAction func DontSignInClicked(sender: UIButton) {
        var main = self.storyboard?.instantiateViewControllerWithIdentifier("mainView") as! SWRevealViewController
        self.presentViewController(main, animated: false, completion: nil)
    }

    
    
    
}
