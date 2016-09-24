//
//  SettingsViewController.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/09/24.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit
import FontAwesomeKit


class SettingsViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Initialize Tab Bar Item
        let userIcon: FAKFontAwesome = FAKFontAwesome.userIconWithSize(20)
        let image = self.imageFromAFont(userIcon)
        tabBarItem = UITabBarItem(title: "settings", image: image, tag: 1)
        
        // Configure Tab Bar Item
        tabBarItem.badgeValue = "8"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // set left navBarIcon to open left menu
        let cogIcon : FAKFontAwesome = FAKFontAwesome.naviconIconWithSize(20)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
