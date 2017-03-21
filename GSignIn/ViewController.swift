//
//  ViewController.swift
//  GSignIn
//
//  Created by Gabriel Theodoropoulos on 8/7/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }


    @IBOutlet weak var signInButton: GIDSignInButton!
    
    var contentViewController: ContentViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().clientID = "683077729970-is0eiavo11pcbnsb4juk66c7ke92btjl.apps.googleusercontent.com"
        
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.login")
        GIDSignIn.sharedInstance().scopes.append("https://www.googleapis.com/auth/plus.me")
        

       // GIDSignIn.sharedInstance().signInSilently()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "idSegueContent"
        {
            contentViewController = segue.destination as! ContentViewController
        }
    }
    
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: NSError!)
    {
        if (error) != nil
        {
            print(error)
        }
        else
        {
           // performSegue(withIdentifier: "idSegueContent", sender: self)
        }
    }
    
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!)
    {
        if (error) != nil
        {
            print(error)
        }
        
       // contentViewController.dismiss(animated: true, completion: nil)

    }*/
    
}

