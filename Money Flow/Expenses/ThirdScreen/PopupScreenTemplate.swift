//
//  PopupScreenTemplate.swift
//  Money Flow
//
//  Created by User on 08.05.2024.
//

import Foundation
import UIKit

struct PopupScreenTemplate {
    
    static func emojis() -> [String] {
        let emojisString: String = "😀😃😄😁😆😅🤣😂🙂🙃😉😊😇🥰😍🤩😘😗☺😲😳🥺😦😧😨😰😥😢😭😱😖😣😞😓😩😫😤😡😠🤬😈👿💀☠💩🤡👹👺👻👽👾🤖😺😸😹😻😼😽🙀😿😾🙈🙉🙊💋💌💘💝💖💗💓💞💕💟❣💔❤🧡💛💚💙💜🖤💯💢💥💫💦💨🕳💣💬👁️‍🗨️🗨🗯💭💤🐵🐒🦍🐶🐕🐩🐺🦊🦝🐱🐈🦁🐯🐅🐆🐴🐎🦄🦓🦌🐮🐂🐃🐄🐷🐖🐗🐽🐏🐑🐐🐪🐫🦙🦒🐘🦏🦛🐭🐁🇺🇲🇺🇳🇺🇸🇺🇾🇺🇿🇻🇦🇻🇨🇻🇪🇻🇬🇻🇮🇻🇳🇻🇺🇼🇫🇼🇸🇽🇰🇾🇪🇾🇹🇿🇦🇿🇲🇿🇼🏴󠁧󠁢󠁥󠁮󠁧󠁿🏴󠁧󠁢󠁳󠁣󠁴󠁿🏴󠁧󠁢󠁷󠁬󠁳󠁿"
        var emojis: [String] = []
        for emoji in emojisString {
            emojis.append(String(emoji))
        }
        return emojis
    }
    
    static func getEmojiInformation() -> ([String], String, CGFloat, CGFloat) {
        let emojiCellID = "EmojiCell"
        return (emojis(), emojiCellID, 10, 3)
    }
    
    static func getCategoriesInformation() -> ([Category], String, CGFloat, CGFloat) {
        let categoryCellID = "CategoryCell"
        let categories: [Category] = [
            Category(name: "Car", image: UIImage(named: "Car")!, backgroundColor: #colorLiteral(red: 0.9731522202, green: 0.9238572717, blue: 0.9159588218, alpha: 1)),
            Category(name: "Bags", image: UIImage(named: "Bags")!, backgroundColor: #colorLiteral(red: 0.9981009364, green: 0.963594377, blue: 0.9121462703, alpha: 1)),
            Category(name: "Banana", image: UIImage(named: "Banana")!, backgroundColor: #colorLiteral(red: 0.8349118829, green: 0.9203750491, blue: 0.9531015754, alpha: 1)),
            Category(name: "Pill", image: UIImage(named: "Pill")!, backgroundColor: #colorLiteral(red: 0.939599514, green: 0.9696645141, blue: 0.89979285, alpha: 1)),
            Category(name: "Cutlery", image: UIImage(named: "Cutlery")!, backgroundColor: #colorLiteral(red: 0.9153895974, green: 0.9056152701, blue: 0.9657009244, alpha: 1)),
            Category(name: "House", image: UIImage(named: "House")!, backgroundColor: #colorLiteral(red: 0.9192375541, green: 0.9743735194, blue: 0.9603385329, alpha: 1))
        ]
        return (categories, categoryCellID, 2, 25)
    }
    
}

