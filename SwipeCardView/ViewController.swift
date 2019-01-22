//
//  ViewController.swift
//  SwipeCardView
//
//  Created by Hadi Husseini on 1/21/19.
//  Copyright © 2019 hadi. All rights reserved.
//


import Foundation
import UIKit
import Kingfisher

class ViewController : UIViewController,KolodaViewDelegate,KolodaViewDataSource,UIScrollViewDelegate,OverLayDelegate {

    
    @IBOutlet weak var kolodaView: KolodaView!
    @IBOutlet weak var gradiantView: UIView!
    @IBOutlet weak var laterBtn: UIButton!
    @IBOutlet weak var acceptBtn: UIButton!
    @IBOutlet weak var declineBtn: UIButton!
    @IBOutlet weak var maxView: UIView!
    @IBOutlet weak var headerHeightConst: NSLayoutConstraint!
    @IBOutlet weak var headerView: CardHeaderView!
    
    var array = [Model]()
    var directions = [SwipeResultDirection.left,SwipeResultDirection.right ,SwipeResultDirection.up]
    var nextPage = ""
    enum State {
        case close
        case open
    }
    var state:State = .close
    var headerState:State = .open
    
    var originalCardFrame:CGRect!
    var lastContentOffset: CGFloat = 0
    var currentTableView:UITableView!
    
   var currentHeaderView:CardHeaderView!
    var headerHeight:CGFloat = 200
    var blurredImage:UIImage? = nil
    var firstTime = true
    var tagViewHeight:CGFloat = 0
    var descLblHeight:CGFloat = 0
    
    var previousScrollMoment: Date = Date()
    var previousScrollY: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       GetModelData()
        
        kolodaView.isHorizontalDragEnabled = true
        kolodaView.isRotatePointEbabled = true
        kolodaView.isScaleDownEnabled = false
      
        
        
        kolodaView.alphaValueSemiTransparent = 1
        laterBtn.cornerRadius(radius: laterBtn.frame.height/2)
        laterBtn.addShadowOnBottom()
        acceptBtn.cornerRadius(radius: acceptBtn.frame.height/2)
        acceptBtn.addShadowOnBottom()
        declineBtn.cornerRadius(radius: declineBtn.frame.height/2)
        declineBtn.addShadowOnBottom()
        if let cView = kolodaView.subviews.last as? DraggableCardView {
            cView.overlayDelegate = self
        }
        currentTableView.register(UINib(nibName: "CandidateCardCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
    }

    func GetModelData(){
        
        var Item1 = Model()
        Item1.id = "https://perureports.com/wp-content/uploads/2018/02/travel-2.jpg"
        Item1.Title = "Title 1"
        Item1.profileId = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaiSahr7kKS7YkOelZE0XZe9HfqTLyU_CDFiYrXlT8idzXvRC6ig"
        
        var Item2 = Model()
        Item2.id = "https://www.oxforduniversityimages.com/wmpix/pad/002/pad002011-01-The%20River%20Cherwell%20in%20Christ%20Church%20Meadow.jpg"
        Item2.Title = "Title 2"
        Item2.profileId = "https://i.pinimg.com/originals/b8/1b/71/b81b71074d3d429acf73816044800f46.jpg"
        
        var Item3 = Model()
        Item3.id = "https://www.oxforduniversityimages.com/wmpix/new/000/new000114-01-Strolling%20in%20the%20gardens.jpg"
        Item3.Title = "Title 3"
        Item3.profileId = "https://i.pinimg.com/originals/77/34/91/77349132cca091f162fed320be3330d5.jpg"
        
        var Item4 = Model()
        Item4.id = "https://www.oxforduniversityimages.com/wmpix/jud/000/jud000681-01-Lady%20Margaret%20Hall.jpg"
        Item4.Title = "Title 4"
        Item4.profileId = "https://secure.i.telegraph.co.uk/multimedia/archive/03249/archetypal-female-_3249633c.jpg"
        
        var Item5 = Model()
        Item5.id = "https://www.oxforduniversityimages.com/wmpix/jud/000/jud000848-01-Oxford's%20skyline%20from%20South%20Parks.jpg"
        Item5.Title = "Title 5"
        Item5.profileId = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCDUKe4Qeg9oGSO4IrVObl55iWG_jDfQWJ6vZsnOytDfcdKuHxqg"
        
        
        array.append(Item1)
        array.append(Item2)
        array.append(Item3)
        array.append(Item4)
        array.append(Item5)
    
        kolodaView.reloadData()
        currentTableView.reloadData()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }
    
    
    override func viewDidLayoutSubviews() {
        gradiantView.gradient(colorTop: Colors.oxfordBlue, colorBottom: Colors.hanBlue, frame: view.frame,fromTop: true)
        for i in kolodaView.subviews {
            i.addShadow()
        }
    }
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        
        koloda.reloadData()
        currentTableView.reloadData()
        
        
        UIView.animate(withDuration: 0, animations: {() -> Void in
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.acceptBtn.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.declineBtn.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        })
        
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
    }
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return array.count
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let v = CardView.instanceFromNib()
        v.headerHeight.constant = headerHeight
        headerState = .open
        headerHeightConst.constant = headerHeight
        v.cornerRadius(radius: 10)
        
        v.jobTitle.text = array[index].Title!
        let url1 = URL(string: array[index].id!)!
            v.headerView.backgroundImg.kf.setImage(with: url1)
        
        let url2 = URL(string: array[index].profileId!)!
        v.headerView.avatarImg.kf.setImage(with: url2)
      
        return v
    }
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("CustomOverlayView", owner: self, options: nil)?[0] as? CustomOverlayView
    }
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return directions
    }
    
    @IBAction func acceptBtnAct(_ sender: Any) {
        if state == .open {
            currentTableView.setContentOffset(CGPoint(x: 0, y: -5), animated: true)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
                self.kolodaView.swipe(SwipeResultDirection.right)
            }
        }
        else {
            kolodaView.swipe(SwipeResultDirection.right)
            
        }
    }
    @IBAction func declineBtnAct(_ sender: Any) {
        if state == .open {
            currentTableView.setContentOffset(CGPoint(x: 0, y: -5), animated: true)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
                self.kolodaView.swipe(SwipeResultDirection.left)
            }
            
        }
        else {
            kolodaView.swipe(SwipeResultDirection.left)
        }
    }
    @IBAction func laterBtnAct(_ sender: Any) {
        if state == .open {
            currentTableView.setContentOffset(CGPoint(x: 0, y: -5), animated: true)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
                self.kolodaView.swipe(SwipeResultDirection.up)
            }
            
        }
        else {
            kolodaView.swipe(SwipeResultDirection.up)
        }
    }
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        //user swipe card or click action
               // var id = array[index].id!
        
                if direction == .left {
                
                }else if direction == .right {
                    
                }else if direction == .up {
                    
                }
        
        
    }
    func overlay(_ progrees: CGFloat,_ direction:SwipeResultDirection?) {
        guard let card = kolodaView.viewForCard(at: kolodaView.currentCardIndex) else{return}
        for i in card.subviews {
            if let header = i as? CardHeaderView {
                if direction != nil {
                    if direction! == .left {
                        header.overlayImage.backgroundColor = Colors.jasper
                        header.iconLbl.textColor = Colors.whiteWithAlpha53
                        header.iconLbl.alpha = progrees
                        header.iconLbl.text = "\(Character(UnicodeScalar(UInt32(hexString: "f00d")!)!))"
                        
                        UIView.animate(withDuration: 0.5, animations: {() -> Void in
                            if progrees > 0.005 {
                                self.declineBtn.transform = CGAffineTransform(scaleX: progrees + 1, y: progrees + 1)
                            }
                        }, completion: {(_ finished: Bool) -> Void in
                            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                            })
                        })
                        
                    }
                    else if direction! == .right {
                        header.overlayImage.backgroundColor = Colors.yellowGreen
                        header.iconLbl.textColor = Colors.whiteWithAlpha53
                        header.iconLbl.text = "\(Character(UnicodeScalar(UInt32(hexString: "f00c")!)!))"
                        header.iconLbl.alpha = progrees
                   
                        UIView.animate(withDuration: 0.5, animations: {() -> Void in
                            if progrees > 0.005 {
                                self.acceptBtn.transform = CGAffineTransform(scaleX: progrees + 1, y: progrees + 1)
                            }
                        }, completion: {(_ finished: Bool) -> Void in
                            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                            })
                        })
                    
                        
                    }
                    //                    else if direction! == .up {
                    //                        header.overlayImage.backgroundColor = Colors.clear
                    //                        header.iconLbl.alpha = 0
                    //
                    //                    }
                }
                else {
                    header.iconLbl.alpha = 0
                    UIView.animate(withDuration: 0, animations: {() -> Void in
                    }, completion: {(_ finished: Bool) -> Void in
                        UIView.animate(withDuration: 0.5, animations: {() -> Void in
                            self.acceptBtn.transform = CGAffineTransform(scaleX:  1, y:  1)
                            self.declineBtn.transform = CGAffineTransform(scaleX:  1, y:  1)
                        })
                    })
                    
                }
                header.overlayImage.alpha = progrees
            }
        }
    }
    func koloda(_ koloda: KolodaView, didShowCardAt index: Int) {
        if let cView = koloda.currentCard {
            cView.overlayDelegate = self
            
            UIView.animate(withDuration: 0, animations: {() -> Void in
            }, completion: {(_ finished: Bool) -> Void in
                UIView.animate(withDuration: 0.5, animations: {() -> Void in
                    self.acceptBtn.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.declineBtn.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
            })
            
        }
    }
    
}

extension ViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if array.count != 0 {
//            return 1
//        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CandidateCardCell
        cell.titleView.cornerRadius(radius: 5)

        if blurredImage != nil {
            headerView.backgroundImg.image = blurredImage
        }
        headerView.scalerLbl.isUserInteractionEnabled = true
     
        descLblHeight = cell.descLbl.intrinsicContentSize.height
        cell.descHeight.constant = descLblHeight+33
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500+tagViewHeight+descLblHeight
    }

    func closeHeader(){
        if headerState == .open {
            headerState = .close
            self.currentTableView.beginUpdates()
            self.currentTableView.endUpdates()
        }
    }
    func openHeader(){
        if headerState == .close {
            headerState = .open
            self.currentTableView.beginUpdates()
            self.currentTableView.endUpdates()
        }
    }
}

extension UIView {
   
    public func addBorder(width:CGFloat,color:UIColor){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    public func cornerRadius(radius:CGFloat){
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    public func gradient(colorTop:UIColor,colorBottom:UIColor,frame:CGRect,fromTop:Bool=false){
        let gl = CAGradientLayer()
        gl.frame = frame
        gl.colors = [colorTop.cgColor, colorBottom.cgColor]
        if fromTop {
            gl.locations = [0.0, 1.0]
        }
        else {
            gl.locations = [1.0, 1.0]
        }
        self.layer.addSublayer(gl)
    }
 
    func addShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 8
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        //        self.layer.shouldRasterize = true
    }
    func addShadowOnBottom(cornerRadius:CGFloat?=nil){
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 3
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius ?? self.frame.height/2
    }
  
   
    
}


extension UInt32 {
    init?(hexString: String) {
        let scanner = Scanner(string: hexString)
        var hexInt = UInt32.min
        let success = scanner.scanHexInt32(&hexInt)
        if success {
            self = hexInt
        } else {
            return nil
        }
    }
}

