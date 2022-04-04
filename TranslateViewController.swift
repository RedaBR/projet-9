//
//  TranslateViewController.swift
//  Baluchon
//
//  Created by Reda on 15/03/2022.
//

import UIKit

class TranslateViewController: UIViewController, UITextFieldDelegate {

  
    
    @IBOutlet weak var textFr: UITextField!
    @IBOutlet weak var textEn: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textFr.delegate = self
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textToTranslate = textFr.text!
        TranslateService(session: URLSession(configuration: .default)).getTranslate(text: textToTranslate) { (data, success) in
            if success == true {
                self.textEn.text = data?.data.translations.first?.translatedText
                
            }
        }
        
        return true
    }
    
}


