//
//  AddScreenViewController.swift
//  
//
//  Created by User on 08.05.2024.
//

import UIKit

class AddScreenViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var choiceTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    var backgroundColor: UIColor!
    var categoryName: String!
    
    weak var delegate: DetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenNameLabel.text = categoryName
        mainView.backgroundColor = backgroundColor
        saveButton.backgroundColor = backgroundColor
        saveButton.layer.cornerRadius = 15
        panelView.layer.cornerRadius = 20
        panelView.dropShadow()
        warningLabel.isHidden = true
    }
    
    @IBAction func nameDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func dateDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func costDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func iconDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func dropdownButtonAction(_ sender: Any) {
        guard let popupScreenViewController = storyboard?.instantiateViewController(withIdentifier: "PopupScreenViewController") as? PopupScreenViewController else { return }
        
        popupScreenViewController.delegate = self
//        popupScreenViewController.dataSource = self
        present(popupScreenViewController, animated: true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        guard let name = nameTextField.text, let date = dataTextField.text, let cost = costTextField.text, let icon = choiceTextField.text else {
            warningLabel.isHidden = false
            return
        }
        if !checkData(date: date, cost: cost, icon: icon) {
            warningLabel.isHidden = false
            return
        }
        warningLabel.isHidden = true
        let expense = ExpenseInfo(categoryName: categoryName, name: name, date: date, icon: icon, cost: CGFloat(Float(cost)!))
        DataBase.addExpense(expense)
        delegate?.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    private func checkData(date: String, cost: String, icon: String) -> Bool {
        // Lấy ngày, tháng, và năm từ chuỗi ngày
        guard let dateDay = Int(date.prefix(2)),
              let dateMonth = Int(date.dropFirst(3).prefix(2)),
              let dateYear = Int(date.suffix(4)) else {
            return false
        }
        
        // Lấy các thành phần của ngày hiện tại
        let currentDate = Date()
        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: currentDate)
        let currentMonth = calendar.component(.month, from: currentDate)
        let currentDay = calendar.component(.day, from: currentDate)
        
        // Kiểm tra tính hợp lệ của ngày
        let dateCondition = date.count == 10 &&
                            1 <= dateDay && dateDay <= 31 &&
                            1 <= dateMonth && dateMonth <= 12 &&
                            dateYear <= currentYear &&
                            (dateYear != currentYear || (dateMonth <= currentMonth && (dateMonth != currentMonth || dateDay <= currentDay)))
        
        // Kiểm tra tính hợp lệ của chi phí
        let costCondition = Float(cost) != nil
        
        // Kiểm tra tính hợp lệ của biểu tượng (kiểm tra nếu là một emoji đơn lẻ)
        let iconCondition = icon.isSingleEmoji
        
        // Trả về kết quả tổng hợp của tất cả các điều kiện
        return dateCondition && costCondition && iconCondition
    }
    
    func updateChoiceWith(_ choice: String) {
        choiceTextField.text = choice
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let components = string.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        if filtered == string {
            return true
        }
        if string == "." {
            let countdots = textField.text!.components(separatedBy: ".").count - 1
            return countdots <= 0
        }
        return false
    }
}

extension String {
    var isSingleEmoji: Bool {
        return count == 1 && containsEmoji
    }
    var containsEmoji: Bool {
        return contains { $0.isEmoji }
    }
}

extension Character {
    var isSimpleEmoji: Bool {
        guard let firstScalar = unicodeScalars.first else {
            return false
        }
        return firstScalar.properties.isEmoji && firstScalar.value > 0x238C
    }
    var isCombinedIntoEmoji: Bool {
        unicodeScalars.count > 1 && unicodeScalars.first?.properties.isEmoji ?? false
    }
    var isEmoji: Bool { isSimpleEmoji || isCombinedIntoEmoji }
}
