//
//  GeneralAttributes.swift
//  AppCelulas
//
//  Created by elaniin on 11/6/17.
//  Copyright © 2017 elaniin. All rights reserved.
//

import Foundation
import UIKit

class GeneralAttributes{
    
    
    //Fill with a custom Message Alert
    static func showAlertMessage(titleStr:String, messageStr:String,fromController controller: UIViewController) -> Void {
        let alertController = UIAlertController(title: titleStr, message: messageStr, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        //...
        controller.present(alertController, animated: true, completion: nil)
    }
    

    //Circleimageview
    static func circleimage(imageview: UIImageView){
        imageview.layoutIfNeeded()
        imageview.layer.cornerRadius = imageview.frame.size.width / 2
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = imageview.frame.size.width / 2;
        imageview.clipsToBounds = true;
        
    }
    
    //Set an image into Itembar
    static func imageItembar(image: String) -> UIImage{
        return (UIImage(named: image)?.withRenderingMode(.alwaysOriginal))!
    }
    
    //ValidateEmail
    static func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    //validate password
    static func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z0-9]{8,}$")
        return passwordTest.evaluate(with: password)
    }
    
    //Hexa string color turn into UIColor
    static func hexStringToUIColor (hex:String) -> UIColor {
    
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    //Set a textfield with only one line at the bottom
    static func borderBottonmTextField(textField: UITextField){
        let borderBottom = CALayer()
        let borderWidth = CGFloat(2.0)
        borderBottom.borderColor = UIColor.gray.cgColor
        borderBottom.frame = CGRect(x: 0, y: textField.frame.height - 1.0, width: textField.frame.width , height: textField.frame.height - 1.0)
        borderBottom.borderWidth = borderWidth
        textField.layer.addSublayer(borderBottom)
        textField.layer.masksToBounds = true
        textField.tintColor = .white
    }
 
    
}
