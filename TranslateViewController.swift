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
            } else if success == false {
                self.presentAlert(with: "Veuillez vérifier l'état de votre réseau")
            }
        }
        textField.resignFirstResponder()
        return true
    }
    
    func presentAlert(with error: String) {
        let alert = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}


