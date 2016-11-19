//
//  ViewController.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/05/11.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pageMenu : CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        
        // MARK: - UI Setup
        self.title = "Dev News"
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.tintColor = UIColor.gray
        
        let backItem = UIBarButtonItem(title: "", style: .bordered, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backItem
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:

//        var controller1 : UIViewController = TableViewController(nibName: "TableViewController", title: "top")
//        controllerArray.append(controller1)
        
        let storyboard = UIStoryboard(name: "EntriesCollectionViewController", bundle: nil)
        //let controller1 = storyboard.instantiateViewController(withIdentifier: "EntriesCollectionViewController")
        let controller1 = EntryWireframe().list()

        controller1.title = "top"
        controllerArray.append(controller1)
        
        var controller2 : UIViewController = TableViewController(nibName: "TableViewController", title: "ruby")
        controllerArray.append(controller2)
        
        var controller3 : UIViewController = TableViewController(nibName: "TableViewController", title: "ios")
        controllerArray.append(controller3)
        
        var controller4 : UIViewController = TableViewController(nibName: "TableViewController", title: "infrastructure")
        controllerArray.append(controller4)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        var parameters: [CAPSPageMenuOption] = [
            .selectionIndicatorColor(UIColor.clear),
            .viewBackgroundColor(UIColor.white),
            .menuItemFont(UIFont(name: "HelveticaNeue-Bold", size: 16.0)!),
            .menuHeight(30.0),
            .menuMargin(0),
            .menuItemWidth(120),
            .centerMenuItems(true)
        ]
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMove(toParentViewController: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

