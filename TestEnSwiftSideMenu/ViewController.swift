//
//  ViewController.swift
//  TestEnSwiftSideMenu
//
//  Created by Jose Manuel Perez on 2/9/16.
//  Copyright © 2016 Jose Manuel Perez. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
class ViewController : UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.sideMenuController()?.sideMenu?.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*override func awakeFromNib() {
        let nvc: UINavigationController = UINavigationController()
//        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        UINavigationBar.appearance().tintColor = UIColor.redColor()
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("Main") {
            self.mainViewController = controller
            nvc.viewControllers = [self.mainViewController!]
        }
        if let controller = self.storyboard?.instantiateViewControllerWithIdentifier("Left") {
            self.leftViewController = controller
//            controller.m
        }
        


        

        super.awakeFromNib()
    }*/
    
    
    @IBAction func openMenu(sender: AnyObject) {
        self.toggleSideMenuView()
    }
    // MARK: - ENSideMenu Delegate



}
