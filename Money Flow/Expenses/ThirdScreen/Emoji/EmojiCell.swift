//
//  EmojiCell.swift
//  Money Flow
//
//  Created by User on 08.05.2024.
//

import UIKit

protocol PopupScreenProtocol: UIViewController {
    func updateChoiceWith(_ cellData: String)
}

class EmojiCell: UICollectionViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    
    weak var delegate: PopupScreenProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(_ emoji: String) {
        emojiLabel.text = emoji
    }

    @IBAction func cellButtonAction(_ sender: Any) {
        delegate?.updateChoiceWith(emojiLabel.text ?? "")
        delegate?.dismiss(animated: true)
    }
}
