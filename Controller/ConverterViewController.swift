//
//  ConverterViewController.swift
//  Baluchon
//
//  Created by Reda on 01/03/2022.
//

import UIKit

class ConverterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var eur: UITextField!
    @IBOutlet weak var usd: UITextField!
    @IBOutlet weak var activityController: UIActivityIndicatorView!
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        eur.resignFirstResponder()
        usd.resignFirstResponder()
    }
    var currentRate = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.eur.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateChangeRate()
    }
    func updateChangeRate() {
        activityController.isHidden = false
        ExchangeService.shared.getRate { [self] (Exchange, success) in
            if success == true {
                currentRate = (Exchange?.rates.USD)!
                activityController.isHidden = true
            } else {
                activityController.isHidden = true
                return
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var text = Float(eur.text ?? "")
        
        if text == nil {
            presentAlert(with: "Veuillez indiquer un nombre ou un chiffre")
        }
        
        let textField = Float(textField.text!)
        text = (textField ?? 0.0) * currentRate
        let result = String(text!)
        usd.text = result
        eur.resignFirstResponder()
                return true
    }
    func presentAlert(with error: String) {
        let alert = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}





