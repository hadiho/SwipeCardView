//
//  Colors.swift
//  3SootJobs
//
//  Created by Sina on 5/28/18.
//  Copyright © 2018 Ctrl+Tech 6. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    static let purple = UIColor(red: 51/255, green: 0/255, blue: 102/255, alpha: 1)
    static let platinum = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
    static let white = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    static let whiteWithAlpha = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.38)
    static let whiteWithAlpha53 = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.53)
    static let black = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    static let raspberryPink = UIColor(red: 231/255, green: 70/255, blue: 145/255, alpha: 1)
    static let seaGreen = UIColor(red: 44/255, green: 133/255, blue: 66/255, alpha: 1)
    static let unitedNationsBlue = UIColor(red: 87/255, green: 143/255, blue: 221/255, alpha: 1)
    static let placeHolderColor = UIColor(red: 199/255, green: 199/255, blue: 205/255, alpha: 1)
    static let timberwolf = UIColor(red: 218/255, green: 215/255, blue: 215/255, alpha: 1)
    static let dodgerBlue = UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1)
    static let manatee = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
    static let azure = UIColor(red: 0/255, green: 150/255, blue: 251/255, alpha: 1)
    static let bleuDeFrance = UIColor(red: 66/255, green: 133/255, blue: 244/255, alpha: 1)
    static let deepSkyBlue = UIColor(red: 0/255, green: 184/255, blue: 229/255, alpha: 1)
    static let lavenderMist = UIColor(red: 213/255, green: 227/255, blue: 247/255, alpha: 1)
    static let oxfordBlue = UIColor(red: 2/255, green: 31/255, blue: 71/255, alpha: 1)
    static let hanBlue = UIColor(red: 82/255, green: 105/255, blue: 195/255, alpha: 1)
    static let jasper = UIColor(red: 219/255, green: 64/255, blue: 64/255, alpha: 0.53)
    static let yellowGreen = UIColor(red: 149/255, green: 219/255, blue: 64/255, alpha: 0.53)
    static let hansaYellow = UIColor(red: 235/255, green: 211/255, blue: 113/255, alpha: 1)
    static let mediumTurquoise = UIColor(red: 80/255, green: 227/255, blue: 194/255, alpha: 1)
    static let tickleMePink = UIColor(red: 251/255, green: 134/255, blue: 172/255, alpha: 1)
    static let yellowGreen2 = UIColor(red: 126/255, green: 211/255, blue: 33/255, alpha: 1)
    static let navBackColor = UIColor(red: 111/255, green: 125/255, blue: 146/255, alpha: 1)
    static let mistyRose = UIColor(red: 255/255, green: 232/255, blue: 232/255, alpha: 1)
    static let dimGray =  UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
    static let clear = UIColor.clear
    static let chatPurple = UIColor(red: 202/255, green: 200/255, blue: 249/255, alpha: 1)
    static let chatGreen = UIColor(red: 212/255, green: 238/255, blue: 212/255, alpha: 1)
    static let red = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
    static let napierGreen = UIColor(red: 65/255, green: 117/255, blue: 5/255, alpha: 1)
    static let lightGray = UIColor(red: 154/255, green: 154/255, blue: 154/255, alpha: 1)
    static let whiteSmoke = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
    
    static func randomColor(seed: String) -> UIColor {
        var total: Int = 0
        for u in seed.unicodeScalars {
            total += Int(UInt32(u))
        }
        
        srand48(total * 200)
        let r = CGFloat(drand48())
        
        srand48(total)
        let g = CGFloat(drand48())
        
        srand48(total / 200)
        let b = CGFloat(drand48())
        
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}
