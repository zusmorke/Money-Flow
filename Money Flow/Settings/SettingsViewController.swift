//
//  SettingsViewController.swift
//  Money Flow
//
//  Created by User on 08.05.2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var gearImage: UIImageView!
    
    @IBOutlet weak var limitbutton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        limitbutton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 10
    }

    @IBAction func goToLimits(_ sender: Any) {
        let newVC = storyboard?.instantiateViewController(identifier: "LimitsViewController") as? LimitsViewController ?? LimitsViewController()
        navigationController?.pushViewController(newVC, animated: true)
    }
    
    
    @IBAction func deleteAll(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Bạn có chắc muốn đặt lại và thoát app không?", preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Không", style: .cancel) { _ in

        }

        let acceptAction = UIAlertAction(title: "Có", style: .default) { _ in
            DataBase.deleteAllData()
            GoalsContainer.deleteAll()
            
            // Them doan ma nay de thoat ung dung
            DispatchQueue.main.async {
                exit(0)
            }
        }

        alert.addAction(cancelAction)
        alert.addAction(acceptAction)

        self.present(alert, animated: true, completion: nil)
    }
    
}
