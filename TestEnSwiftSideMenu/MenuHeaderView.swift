//MenuHeaderView
//  MenuHeaderViewController.swift
//  SideMenu
//
//  Created by Jose Manuel Perez on 12/1/15.
//  Copyright © 2015 tecprosolutions. All rights reserved.
//

import UIKit



@IBDesignable class MenuHeaderView: UIView {
    
    var view : UIView!
    var delegate : HeaderTableViewProtocol?
    var isExpanded : Bool = false
    
    //Outlets
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    
    @IBInspectable var image : UIImage{
        get{
            return imageProfile.image!
        }
        set(image){
            imageProfile.image = image
        }
    }
    
    @IBInspectable var name : String{
        get{
            return userName.text!
        }
        set(name){
            userName.text = name
        }
    }
    
    func doRoundedCornersImage(){
//        self.imageProfile.layer.cornerRadius = (self.imageProfile.frame.size.width/3)
        self.imageProfile.layer.cornerRadius = 35
        self.imageProfile.clipsToBounds = true
        //Agrega borde
        self.imageProfile.layer.borderWidth = 1.0;
        self.imageProfile.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    
    override init(frame: CGRect) {
        // 1. setup any properties here
        // 2. call super.init(frame:)
        super.init(frame: frame)
        // 3. Setup view from .xib file
        xibSetup()
        self.doRoundedCornersImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // 1. setup any properties here
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
        
        self.doRoundedCornersImage()
        
    }
    
    func xibSetup(){
        view = loadViewFromNib()
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "MenuHeaderView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    @IBAction func btnExpand(sender: UIButton) {
        //Alterna entre isExpanded
        self.isExpanded = !self.isExpanded
        self.delegate!.expandConfigSection(self.isExpanded)
    }
}

protocol HeaderTableViewProtocol{
    func expandConfigSection(isExpanded : Bool)
}
