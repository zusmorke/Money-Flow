//
//  CategoryTableViewCell.swift
//  Money Flow
//
//  Created by User on 08.05.2024.
//

import UIKit

class IncomesTableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cellValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(_ income: IncomeInfo) {
        cellImage.image = income.icon.emojiToImage()
        cellImage.layer.cornerRadius = 20
        nameLabel.text = income.source
        dateLabel.text = income.date
        cellValue.text = income.getPrettyStringForWorth()
    }

}

extension String {
    func emojiToImage() -> UIImage? {
        let size = CGSize(width: 100, height: 100)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.init(cgColor: #colorLiteral(red: 0.9018717408, green: 0.902023077, blue: 0.9018517733, alpha: 1)).set()
        let rect = CGRect(origin: CGPoint(), size: size)
        UIRectFill(rect)
        (self as NSString).draw(at: CGPoint(x: 28, y: 24), withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 45)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
