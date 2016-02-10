//
//  RootNavigationControllerViewController.swift
//  TestEnSwiftSideMenu
//
//  Created by Jose Manuel Perez on 2/10/16.
//  Copyright © 2016 Jose Manuel Perez. All rights reserved.
//

import UIKit

class RootNavigationControllerViewController: ENSideMenuNavigationController ,ENSideMenuDelegate/*ENSideMenuNavigationController,ENSideMenuDelegate */{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: MenuViewController(), menuPosition:.Left)
        //sideMenu?.delegate = self //optional
        sideMenu?.menuWidth = 180.0 // optional, default is 160
        //sideMenu?.bouncingEnabled = false
        //sideMenu?.allowPanGesture = false
        // make navigation bar showing over side menu
        view.bringSubviewToFront(navigationBar)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - ENSideMenu Delegate
    func sideMenuWillOpen() {
        print("sideMenuWillOpen")
    }
    
    func sideMenuWillClose() {
        print("sideMenuWillClose")
    }
    
    func sideMenuDidClose() {
        print("sideMenuDidClose")
    }
    
    func sideMenuDidOpen() {
        print("sideMenuDidOpen")
    }

   
}
