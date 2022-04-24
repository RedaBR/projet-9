//
//  TranslateViewController.swift
//  Baluchon
//
//  Created by Reda on 15/03/2022.
//

import UIKit

class TranslateViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var activityController: UIActivityIndicatorView!
    @IBOutlet weak var textFr: UITextField!
    @IBOutlet weak var textEn: UITextField!
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textFr.resignFirstResponder()
        textEn.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textFr.delegate = self
        self.textEn.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activityController.isHidden = false
        let textToTranslate = textFr.text!
        TranslateService.shared.getTranslate(text: textToTranslate) { (data, success) in
            if success == true {
                self.activityController.isHidden = true
                self.textEn.text = data?.data.translations.first?.translatedText
            }
        }
        textField.resignFirstResponder()
        return true
    }
}


