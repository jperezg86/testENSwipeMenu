//
//  UtilFunctions.swift
//  AppYa
//
//  Created by JOSAFAT BUSIO on 27/11/15.
//  Copyright © 2015 tecprosolutions. All rights reserved.
//

import Foundation
import UIKit


class UtilFunctions{
    
    // Transforma un rgb
    static func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    /**
     * Muestra un viewControler que se encuentra en un storyboard diferente
     */
    static func   openModuleAsModal(module:String, identifier:String, parent:UIViewController){
        //1.- Colocar el nombre del storyboard
        let storyboard = UIStoryboard(name: module, bundle: nil)
        
        //2.- Colocar el nombre de identificador que se puso en el storyboard del modulo que se quiere invocar
        let controller = storyboard.instantiateViewControllerWithIdentifier(identifier) as UIViewController
        
        //3.-Si no tiene navigation bar se puede invocar asi:
        //self.presentViewController(controller, animated: true, completion: nil)
        parent.parentViewController?.presentViewController(controller, animated: true, completion: nil)
        
    }

    
    static func openModuleWithNavigationBar(module:String, identifier:String, parent:UIViewController){
        let storyboard = UIStoryboard(name: module, bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier(identifier) as UIViewController
        parent.navigationController!.pushViewController(controller, animated: true)
    }
    
    
    /*
    * Devuelve un ViewController a partir de su identificador y su module
    *
    **/
    static func getViewControllerForModule(module:String, identifier:String) -> UIViewController{
        //1.- Colocar el nombre del storyboard
        let storyboard = UIStoryboard(name: module, bundle: nil)
        
        //2.- Colocar el nombre de identificador que se puso en el storyboard del modulo que se quiere invocar
        let controller = storyboard.instantiateViewControllerWithIdentifier(identifier) as UIViewController
        
        return controller

    }
    
    static func addGradientToView(view: UIView, opacity : Float){
        let gradient : CAGradientLayer = CAGradientLayer(layer: view.layer)
        gradient.frame = CGRectMake(0, 0, view.frame.width,view.frame.height + 5)
        gradient.colors = [UIColor.blackColor().CGColor,
            UIColor.whiteColor().colorWithAlphaComponent(0).CGColor,
            UIColor.darkGrayColor().CGColor]
        gradient.opacity = opacity
        view.layer.insertSublayer(gradient, atIndex: 0)
    }
    
    /**
    * Inicializa un UIView a partir de un XIB
    */
    
    static func instanceFromNib(nibName:String) -> UIView {
        return UINib(nibName: nibName, bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
}
