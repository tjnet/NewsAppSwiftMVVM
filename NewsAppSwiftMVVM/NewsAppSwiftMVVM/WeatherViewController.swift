//
//  WeatherViewController.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/09/24.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit
import FontAwesomeKit

class WeatherViewController: UIViewController {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Initialize Tab Bar Item
        let weatherIcon: FAKFontAwesome = FAKFontAwesome.cloudIconWithSize(20)
        let image = self.imageFromAFont(weatherIcon)
        tabBarItem = UITabBarItem(title: "weather", image: image, tag: 4)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
