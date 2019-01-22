//
//  CardHeaderView.swift
//  3SootJobs
//
//  Created by Sina on 6/20/18.
//  Copyright © 2018 Ctrl+Tech 6. All rights reserved.
//

import Foundation
import UIKit

class CardHeaderView: UIView {
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var immediateLbl: UILabel!
    @IBOutlet weak var specialLbl: UILabel!
    @IBOutlet weak var companyTitleLbl: UILabel!
    @IBOutlet weak var scalerLbl: UILabel!
    @IBOutlet weak var overlayImage: UIImageView!
    @IBOutlet weak var iconLbl: UILabel!
    
    @IBOutlet weak var backgroundImgBottomConst: NSLayoutConstraint!
    class func instanceFromNib() -> CardHeaderView {
        return UINib(nibName: "CardHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CardHeaderView
    }
}
