//
//  StatisticsViewController.swift
//  Money Flow
//
//  Created by User on 08.05.2024.
//
import Foundation
import UIKit

class StatisticsViewController: UIViewController {
    
    @IBOutlet weak var chartView: UIView!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var monthButton: UIBarButtonItem!
    
    @IBOutlet weak var getbackButton: UIButton!
    
    @IBOutlet weak var popupView: UIView!
    
    @IBOutlet weak var monthPicker: UIPickerView!
    
    @IBOutlet weak var visualeffectView: UIVisualEffectView!
    
    @IBOutlet weak var currentChart: UILabel!
    
    var effect: UIVisualEffect!
    
    var months: [String] = ["Tatca","thang1", "thang2" ,"thang3" ,"thang4" ,"thang5" ,"thang6" ,"thang7", "thang8" , "thang9", "thang10" ,"thang11" , "thang12"]
    
    var selectedMonth: String!

    
    let pieChartView = PieChartView()
    
    @IBAction func monthButtonAction(_ sender: Any) {
        animateIn()

    }
    
    @IBAction func getbackButtonAction(_ sender: Any) {
        animateOut()

    }
    
    func animateIn() {
        self.view.addSubview(popupView)
        popupView.center = self.view.center
        
        popupView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popupView.alpha = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.popupView.alpha = 1
            self.popupView.transform = CGAffineTransform.identity
        } )
        
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.4, animations: {
            self.popupView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popupView.alpha = 0
            self.visualeffectView.effect = nil
        }){ (success: Bool) in
            self.popupView.removeFromSuperview()
            
        }
    }

    func makeNumberMonth(month:String) -> String {
        switch month {
        case "thang1":
            return "01"
        case "thang2":
            return "02"
        case "thang3":
            return "03"
        case "thang4":
            return "04"
        case "thang5":
            return "05"
        case "thang6":
            return "06"
        case "thang7":
            return "07"
        case "thang8":
            return "08"
        case "thang9":
            return "09"
        case "thang10":
            return "10"
        case "thang11":
            return "11"
        case "thang12":
            return "12"
        default:
            return "01"
        }
    }
    func drawCurrentChart(month:String)  {
        if month == "Chi phí trong suốt thời gian" {
            
            var myImage = UIImage(named: "anhmo")!
            var myImageView = UIImageView(image: myImage)
            myImageView.layer.cornerRadius = 13
            myImageView.frame = CGRect(x: 0, y: 0, width: 331, height: 320)
            chartView.addSubview(myImageView)
            chartView.layer.cornerRadius = 13
            
            
            let padding: CGFloat = 40
            let height = chartView.frame.height - padding

            pieChartView.frame = CGRect(
              x: 0, y: padding - 30, width: chartView.frame.size.width  , height: height
            )

            pieChartView.segments = makeLabelledSegmentArray()
            pieChartView.segmentLabelFont = .systemFont(ofSize: 18)
            pieChartView.tintColor.rgbaComponents

            chartView.addSubview(pieChartView)
            chartView.layer.cornerRadius = 13
            
            tableView.reloadData()
        } else {
        
        var count: CGFloat = 0
        var chartElements:[LabelledSegment] = []
        
        var temporary: [ExpenseInfo] = []
        
        temporary = DataBase.getExpensesArrayIn(category: "Car")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), name: "🚘", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        
        temporary = DataBase.getExpensesArrayIn(category: "Bags")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), name: "🛍", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "Banana")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), name: "🍌", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "Pill")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.392156863, green: 0.945098039, blue: 0.717647059, alpha: 1), name: "💊", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "Cutlery")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), name: "🍽", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        temporary = DataBase.getExpensesArrayIn(category: "House")
        if temporary.count > 0{
            for i in temporary {
                if i.date.contains(".\(makeNumberMonth(month: month)).") {
                    count += i.cost
                }
                
            }
            if count > 0 {
                chartElements.append(LabelledSegment(color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), name: "🏠", value: count))
            }
        }
        count = 0
        temporary.removeAll()
        
        if chartElements.count > 0{
            
            var myImage = UIImage(named: "anhmo")!
            var myImageView = UIImageView(image: myImage)
            myImageView.layer.cornerRadius = 13
            myImageView.frame = CGRect(x: 0, y: 0, width: 331, height: 320)
            chartView.addSubview(myImageView)
            chartView.layer.cornerRadius = 13
            
//            print("zashel v prorosovku")
            
            let padding: CGFloat = 40
            let height = chartView.frame.height - padding
            
            pieChartView.frame = CGRect(
              x: 0, y: padding - 30, width: chartView.frame.size.width  , height: height
            )
            pieChartView.segments.removeAll()

            let answer =  chartElements
             .sorted{ $0.value > $1.value }
                 
            pieChartView.segments = answer
            
            pieChartView.segmentLabelFont = .systemFont(ofSize: 18)
            pieChartView.tintColor.rgbaComponents

            chartView.addSubview(pieChartView)
            

            tableView.reloadData()
//            tableView.delegate = self
//            tableView.dataSource = self
        
        } else {
            
            pieChartView.segments.removeAll()
            
            
            
            var myImage = UIImage(named: "anhmo")!
            var myImageView = UIImageView(image: myImage)
            myImageView.layer.cornerRadius = 13
            myImageView.frame = CGRect(x: 0, y: 0, width: 331, height: 320)
            chartView.addSubview(myImageView)
            
            
             myImage = UIImage(named: "sad")!
             myImageView = UIImageView(image: myImage)
            myImageView.layer.cornerRadius = 13
            myImageView.frame = CGRect(x: 0, y: 0, width: 331, height: 320)
            chartView.addSubview(myImageView)
            
            tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        //
        super.viewDidLoad()

        monthPicker.dataSource = self
        monthPicker.delegate = self
        
        effect = visualeffectView.effect
        
        visualeffectView.effect = nil
        
        popupView.layer.cornerRadius = 13
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let padding: CGFloat = 40
        let height = chartView.frame.height - padding

        pieChartView.frame = CGRect(
          x: 0, y: padding - 30, width: chartView.frame.size.width  , height: height
        )

        pieChartView.segments = makeLabelledSegmentArray()
        pieChartView.segmentLabelFont = .systemFont(ofSize: 18)
        pieChartView.tintColor.rgbaComponents

        chartView.addSubview(pieChartView)
        chartView.layer.cornerRadius = 13
        
        currentChart.text = "Chi phí trong suốt thời gian (\(Int(DataBase.getTotalExpenses()))$)"
        


        // Do any additional setup after loading the view.
    }
    
    func makeLabelledSegmentArray() -> [LabelledSegment] {
        var array: [LabelledSegment] = []
        
        
       var k = DataBase.getTotalExpensesIn(category: "Car")
        if k > 0 {
            array.append(LabelledSegment(color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), name: "🚘", value: k))
        }
        
         k = DataBase.getTotalExpensesIn(category: "Bags")
         if k > 0 {
             array.append(LabelledSegment(color: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), name: "🛍", value: k))
         }
        
         k = DataBase.getTotalExpensesIn(category: "Banana")
         if k > 0 {
             array.append(LabelledSegment(color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), name: "🍌", value: k))
         }
        
         k = DataBase.getTotalExpensesIn(category: "Pill")
         if k > 0 {
             array.append(LabelledSegment(color: #colorLiteral(red: 0.392156863, green: 0.945098039, blue: 0.717647059, alpha: 1), name: "💊", value: k))
         }
        
         k = DataBase.getTotalExpensesIn(category: "Cutlery")
         if k > 0 {
             array.append(LabelledSegment(color: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), name: "🍽", value: k))
         }
        
         k = DataBase.getTotalExpensesIn(category: "House")
         if k > 0 {
             array.append(LabelledSegment(color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), name: "🏠", value: k))
         }
        
        let answer =  array
        .sorted{ $0.value > $1.value }
     return answer
        
    }
    
    func findOverall (array: [LabelledSegment]) -> CGFloat {
        var answer: CGFloat = 0
        
        for i in array {
           answer += i.value
        }
        return answer
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StatisticsViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pieChartView.segments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let k = findOverall(array: pieChartView.segments)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatisticsTableViewCell", for: indexPath) as?
                StatisticsTableViewCell else {return UITableViewCell() }
        cell.setData(expense: pieChartView.segments[indexPath.row], overall: k )
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    
}

extension StatisticsViewController: UIPickerViewDataSource , UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        months.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return months[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let  month = months[row]
        let k = makeNumberMonth(month: month)
        if month == "Chi phí trong suốt thời gian" {
            currentChart.text = "\(month)  \(Int(DataBase.getTotalExpenses()))$ "
            selectedMonth = month
        } else{
            currentChart.text = "\(month) (Số tiền: \(Int(DataBase.getMonthExpensesIn(month: k)))$) "
            selectedMonth = month
        }
        
        drawCurrentChart(month: selectedMonth)

    }
   
}
