//
//  CustomOverlayView.swift
//  3SootJobs
//
//  Created by Sina on 6/24/18.
//  Copyright © 2018 Ctrl+Tech 6. All rights reserved.
//

import Foundation
import UIKit


class CustomOverlayView: OverlayView {
    
    @IBOutlet lazy var overlayImageView: UIImageView! = {
        [unowned self] in
        
        var imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
        
        return imageView
        }()
    

    @IBOutlet weak var imageHeightConst: NSLayoutConstraint!
    
    
    //override var overlayState: SwipeResultDirection?  {
//        didSet {
//            if Device.deviceModel() == .se {
//                imageHeightConst.constant = 150
//            }
//            else if Device.deviceModel() == .eight {
//                imageHeightConst.constant = 250
//            }
//            else if Device.deviceModel() == .plus {
//                imageHeightConst.constant = 315
//            }
//            else if Device.deviceModel() == .x {
//                imageHeightConst.constant = 330
//            }
//            switch overlayState {
//            case .left? :
//                overlayImageView.backgroundColor = Colors.jasper
//            case .right? :
//                overlayImageView.backgroundColor = Colors.yellowGreen
//            default:
//                overlayImageView.image = nil
//            }
//
//        }
    //}
    
}
