//
//  ConvertisseurViewController.swift
//  Baluchon
//
//  Created by Reda on 01/03/2022.
//

import UIKit

class ConvertisseurViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var eur: UITextField!
   
    @IBOutlet weak var usd: UITextField!
    
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
        ExchangeService.shared.getRate { [self] (Exchange, success) in

            if success == false {
                
            } else {
                
            }
            currentRate =  (Exchange?.rates.USD)!
        }
    }
    
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var text = Float(eur.text ?? "")
        
        if text == nil {
            presentAlert(with: "Veuillez indiquer un nombre ou un chiffre")
        }
        let textField = Float(textField.text!)
        text = textField ?? 0.0 * currentRate
        
        let result = String(text!)
        usd.text = result

        return true
    }

    
    func presentAlert(with error: String) {


       let alert = UIAlertController(title: "Erreur", message: error, preferredStyle: .alert)


       let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
     

       alert.addAction(action)
     

       present(alert, animated: true, completion: nil)
     

    }
   
    
}
    




