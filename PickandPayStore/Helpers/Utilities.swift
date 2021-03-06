//
//  Utilities.swift
//  PickandPayStore
//
//  Created by iMac on 4/5/22.
//

import UIKit

class Utilities {
    
    static func isValidPassword(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func isValidEmail(email: String) -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailTest.evaluate(with: email)
    }
    
    
    // UITextField with black background, white text and yellow cursor
    static func styleTextField(_ textfield:UITextField, placeHolderString:String) {
        
        // disable auto capitalize first letter
        textfield.autocapitalizationType = .none
        textfield.textAlignment = .center
        
        // Create the bottom line
        //let bottomLine = CALayer()
        
        //bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 7, width: textfield.frame.width, height: 8)
        
        //bottomLine.backgroundColor = K.Color.Blue.cgColor
        
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 30)
        ]
        textfield.attributedPlaceholder = NSAttributedString(string: placeHolderString, attributes: attributes)
        
        textfield.heightAnchor.constraint(equalToConstant: 35.0).isActive = true
        textfield.setContentHuggingPriority(UILayoutPriority(249), for: .horizontal)
        
        // Remove border on text field
        textfield.borderStyle = .none
        textfield.layer.cornerRadius = 18.0
        
        textfield.backgroundColor =  UIColor.black
        
        textfield.font = UIFont(name: "Bold", size: 45)
        textfield.textColor = UIColor.white
        // set the cursor color
        textfield.tintColor = UIColor.yellow //UIColor.black //K.Color.Blue
        
        // Add the line to the text field
        //textfield.layer.addSublayer(bottomLine)
        
    }
    
    // White filled button with black text
    static func styleFilledButton(_ button:UIButton) {
        
        button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        // Filled rounded corner style
        button.backgroundColor = UIColor.black //K.Color.Blue//.withAlphaComponent(0.7)
        
        button.layer.cornerRadius = 25.0
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.tintColor = UIColor.white
    }
    
    // transparent hollow button with black border and black text
    static func styleHollowButton(_ button:UIButton) {
        
        button.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor //K.Color.Orange.cgColor
        button.backgroundColor = UIColor.clear
        
        button.layer.cornerRadius = 25.0
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.tintColor = UIColor.black
    }
    
    static func fitTextInsideButton(_ button: UIButton) {
        
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.lineBreakMode = .byClipping
        
    }
}

