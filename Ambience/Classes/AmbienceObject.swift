//
//  AmbienceObject.swift
//  Ambience
//
//  Created by Tiago Mergulhão on 03/01/2018.
//

import UIKit

class AmbienceObject : NSObject {
    
    @IBInspectable var invertAvailable : Bool = true
    @IBInspectable var invertLabel : String = "Invert"
    
    @IBInspectable var regularAvailable : Bool = true
    @IBInspectable var regularLabel : String = "Regular"
    
    @IBInspectable var contrastAvailable : Bool = true
    @IBInspectable var contrastLabel : String = "Contrast"
    
    @IBInspectable var autoAvailable : Bool = true
    @IBInspectable var autoLabel : String = "Auto"
    
    @IBOutlet weak var viewController : UIViewController?
    
    @IBAction func switchAmbience (_ sender : AnyObject) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if invertAvailable {
            
            let action = UIAlertAction(title: invertLabel, style: .default) {
                _ in
                Ambience.forcedState = .invert
            }
            
            actionSheet.addAction(action)
        }
        
        if contrastAvailable {
            
            let action = UIAlertAction(title: contrastLabel, style: .default) {
                _ in
                Ambience.forcedState = .contrast
            }
            
            actionSheet.addAction(action)
        }
        
        if regularAvailable {
            
            let action = UIAlertAction(title: regularLabel, style: .default) {
                _ in
                Ambience.forcedState = .regular
            }
            
            actionSheet.addAction(action)
        }
        
        if autoAvailable {
            
            let action = UIAlertAction(title: autoLabel, style: .default) {
                _ in
                Ambience.forcedState = nil
            }
            
            actionSheet.addAction(action)
        }

        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        viewController?.present(actionSheet, animated: true)
    }
}
