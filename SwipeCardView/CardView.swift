//
//  CarView.swift
//  3SootJobs
//
//  Created by Sina on 6/18/18.
//  Copyright © 2018 Ctrl+Tech 6. All rights reserved.
//

import Foundation

import UIKit

class CardView: UIView {
   @IBOutlet weak var headerView: CardHeaderView!
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var jobExp: UILabel!
    @IBOutlet weak var jobLocation: UILabel!
    @IBOutlet weak var jobSalary: UILabel!
    @IBOutlet weak var jobWorkType: UILabel!
    @IBOutlet weak var jobEdu: UILabel!
    
    class func instanceFromNib() -> CardView {

        return UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CardView
    }
}
