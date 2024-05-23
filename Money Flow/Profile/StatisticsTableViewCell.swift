//
//  StatisticsTableViewCell.swift
//  Money Flow
//
//  Created by User on 08.05.2024.
//

import UIKit

class StatisticsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setData(expense: LabelledSegment, overall: CGFloat) {
    
        valueLabel.text = "\(Int((expense.value/overall)*100))%  (\(Int(expense.value))$)"
        
        if expense.name == "🚘" {
            categoryNameLabel.text = "Car"
            categoryImage.image = UIImage(named: "Car")
        }
        if expense.name == "🛍" {
            categoryNameLabel.text = "Bags"
            categoryImage.image = UIImage(named: "Bags")
        }
        if expense.name == "🍌" {
            categoryNameLabel.text = "Banana"
            categoryImage.image = UIImage(named: "Banana")
        }
        if expense.name == "💊" {
            categoryNameLabel.text = "Pill"
            categoryImage.image = UIImage(named: "Pill")
        }
        if expense.name == "🍽" {
            categoryNameLabel.text = "Cutlery"
            categoryImage.image = UIImage(named: "Cutlery")
        }
        if expense.name == "🏠" {
            categoryNameLabel.text = "House"
            categoryImage.image = UIImage(named: "House")
        }
        
        
    }

}
