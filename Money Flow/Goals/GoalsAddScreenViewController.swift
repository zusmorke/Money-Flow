import UIKit

class GoalsAddScreenViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var costTextField: UITextField!
    @IBOutlet weak var choiceTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    weak var delegate: GoalsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func choiceDone(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func dropdownButtonAction(_ sender: Any) {
        guard let popupScreenViewController = storyboard?.instantiateViewController(withIdentifier: "GoalsPopupScreenViewController") as? GoalsPopupScreenViewController else { return }
        
        popupScreenViewController.delegate = self
//        popupScreenViewController.dataSource = self
        present(popupScreenViewController, animated: true)
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        guard let source = nameTextField.text, let date = dataTextField.text, let icon = choiceTextField.text, let worth = costTextField.text else {
            warningLabel.isHidden = false
            return
        }
        if !checkData(date: date, cost: worth, icon: icon) {
            warningLabel.isHidden = false
            return
        }
        warningLabel.isHidden = true
        let income = IncomeInfo(source: source, date: date, icon: icon, worth: CGFloat(Float(worth)!))
        GoalsContainer.add(element: income)
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
