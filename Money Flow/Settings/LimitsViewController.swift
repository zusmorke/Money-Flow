//
//  AddScreenViewController.swift
//  
//
//  Created by User on 08.05.2024.
//

import UIKit

class LimitsViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var choiceTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveButton.layer.cornerRadius = 15
        panelView.layer.cornerRadius = 20
        panelView.dropShadow()
    }

    @IBAction func dropdownButtonAction(_ sender: Any) {
        guard let popupScreenViewController = storyboard?.instantiateViewController(withIdentifier: "SettingsPopupScreenViewController") as? SettingsPopupScreenViewController else { return }
        
        popupScreenViewController.delegate = self
//        popupScreenViewController.dataSource = self
        present(popupScreenViewController, animated: true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        if let choice = choiceTextField.text, let value = Int(costTextField.text ?? "") {
            DataBase.addLimitIn(category: choice, value)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateChoiceWith(_ choice: String) {
        choiceTextField.text = choice
    }
}
