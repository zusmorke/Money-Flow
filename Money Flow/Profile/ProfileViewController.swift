//
//  ProfileViewController.swift
//  Money Flow
//
//  Created by User on 08.05.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var statisticsButton: UIButton!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var panelView: UIView!
    @IBOutlet weak var mainView: UIView!

    @IBOutlet weak var historyButton: UIButton!
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
   
    var isChecked = true
    
    var incomeOperations: [IncomeInfo] = DataBase.getIncomeArray()
    var expenseOperations: [ExpenseInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blurView.layer.cornerRadius = 13
        let blurEffect = UIBlurEffect(style: .light)
        blurView.effect = blurEffect
        expenseOperations = getFullExpenseArray()
        
        historyButton.setTitle("Lịch sử chi tiêu 📉", for: .normal)
        historyButton.setTitleColor(.red, for: .normal)
        tableView.delegate = self
        tableView.dataSource = self
        panelView.layer.cornerRadius = 13
        valueLabel.text = getPrettyStringForLable()
        tableView.reloadData()
    }
    
    @IBAction func statisticsButtonAction(_ sender: Any) {
        guard let statViewController = storyboard?.instantiateViewController(withIdentifier: "StatisticsViewController") as? StatisticsViewController else { return }
        
        navigationController?.pushViewController(statViewController, animated: true)
    }
    
    @IBAction func historyButtonAction(_ sender: Any) {
        isChecked = !isChecked
        
        if isChecked {
            tableView.delegate = self
            tableView.dataSource = self
            historyButton.setTitle("Lịch sử chi tiêu 📉", for: .normal)
            historyButton.setTitleColor(.red, for: .normal)
            tableView.reloadData()
        } else {
            historyButton.setTitleColor(.init(patternImage: UIImage(named: "myGreen")!), for: .normal)
            historyButton.setTitle("Lịch sử thu nhập 📈", for: .normal)
            
            tableView.reloadData()

            tableView.delegate = NewTableGeneratorViewController.newTableGeneratorViewController
            tableView.dataSource = NewTableGeneratorViewController.newTableGeneratorViewController
        }
    }
}

func getPrettyStringForLable() -> String {
    let costArray = Array(String(Int(DataBase.getTotalExpenses())))
    var prettyString = ""
    for (i, digit) in costArray.reversed().enumerated() {
        prettyString = String(digit) + prettyString
        if i % 3 == 2 {
            prettyString = "," + prettyString
        }
    }
    if prettyString.starts(with: ",") {
        prettyString.removeFirst()
    }
    return "$" + prettyString
}
    
func getFullExpenseArray() -> [ExpenseInfo] {
    var expenseOperations: [ExpenseInfo] = []
    var temporary: [ExpenseInfo] = []
    
    temporary = DataBase.getExpensesArrayIn(category: "Car")
    if temporary.count > 0 {
        for i in temporary {
            expenseOperations.append(i)
        }
    }
    temporary.removeAll()
    
    temporary = DataBase.getExpensesArrayIn(category: "Bags")
    if temporary.count > 0 {
        for i in temporary {
            expenseOperations.append(i)
        }
    }
    temporary.removeAll()
    
    temporary = DataBase.getExpensesArrayIn(category: "Banana")
    if temporary.count > 0 {
        for i in temporary {
            expenseOperations.append(i)
        }
    }
    temporary.removeAll()
    
    temporary = DataBase.getExpensesArrayIn(category: "Pill")
    if temporary.count > 0 {
        for i in temporary {
            expenseOperations.append(i)
        }
    }
    temporary.removeAll()
    
    temporary = DataBase.getExpensesArrayIn(category: "Cutlery")
    if temporary.count > 0 {
        for i in temporary {
            expenseOperations.append(i)
        }
    }
    temporary.removeAll()
    
    temporary = DataBase.getExpensesArrayIn(category: "House")
    if temporary.count > 0 {
        for i in temporary {
            expenseOperations.append(i)
        }
    }
    temporary.removeAll()
    return expenseOperations
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return expenseOperations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as? ProfileTableViewCell else { return UITableViewCell() }
        
        cell.backgroundColor = UIColor.clear
        cell.setData(expense: expenseOperations[indexPath.row])
        
        return cell
    }
    
}
