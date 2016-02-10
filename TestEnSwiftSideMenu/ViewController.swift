//
//  ViewController.swift
//  TestEnSwiftSideMenu
//
//  Created by Jose Manuel Perez on 2/9/16.
//  Copyright © 2016 Jose Manuel Perez. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
class ViewController : SlideMenuController{

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.sideMenuController()?.sideMenu?.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("Main") {
            self.mainViewController = controller
        }
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("Left") {
            self.leftViewController = controller
        }
        super.awakeFromNib()
    }
    
    
    @IBAction func openMenu(sender: AnyObject) {
        self.toggleSideMenuView()
    }
    // MARK: - ENSideMenu Delegate



}

