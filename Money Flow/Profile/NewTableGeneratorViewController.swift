//
//  NewTableGeneratorViewController.swift
//  Money Flow
//
//  Created by User on 08.05.2024.
//

import UIKit

class NewTableGeneratorViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
   static let newTableGeneratorViewController = NewTableGeneratorViewController()
    
    var incomeOperations: [IncomeInfo] = DataBase.getIncomeArray()
//    var expenseOperations: [ExpenseInfo] = gettFullExpenseArray()
//
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        incomeOperations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as?
                ProfileTableViewCell else {return UITableViewCell() }
        
        cell.settData(income: incomeOperations[indexPath.row])
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   public  func gettFullExpenseArray() -> [ExpenseInfo] {
        var expenseOperations: [ExpenseInfo] = []
        var temporary: [ExpenseInfo] = []
        
        temporary = DataBase.getExpensesArrayIn(category: "Car")
        if temporary.count > 0{
            for i in temporary {
                expenseOperations.append(i)
            }
        }
        temporary.removeAll()
        
        
        temporary = DataBase.getExpensesArrayIn(category: "Bags")
        if temporary.count > 0{
            for i in temporary {
                expenseOperations.append(i)
            }
        }
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "Banana")
        if temporary.count > 0{
            for i in temporary {
                expenseOperations.append(i)
            }
        }
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "Pill")
        if temporary.count > 0{
            for i in temporary {
                expenseOperations.append(i)
            }
        }
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "Cutlery")
        if temporary.count > 0{
            for i in temporary {
                expenseOperations.append(i)
            }
        }
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "House")
        if temporary.count > 0{
            for i in temporary {
                expenseOperations.append(i)
            }
        }
        temporary.removeAll()
        
        return expenseOperations
    }
}

