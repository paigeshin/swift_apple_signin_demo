//
//  ViewController.swift
//  SignInWithAppleDemo
//
//  Created by shin seunghyun on 2020/10/12.
//

import UIKit

import AuthenticationServices

class ViewController: UIViewController {
    
    let appleProvider = AppleSignInClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let appleButton = ASAuthorizationAppleIDButton()
        view.addSubview(appleButton)
        appleButton.addTarget(self, action: #selector(SignInWithAppleAction(sender:)), for: .touchUpInside)
        appleButton.center = view.center
        
    }
    
    @objc func SignInWithAppleAction(sender: ASAuthorizationAppleIDButton) {

        appleProvider.handleAppleIdRequest { (fullName, email, token) in
            print("""
                fullName: \(fullName)
                email: \(email)
                token: \(token)
            """)
        }
        
    }
    
}
