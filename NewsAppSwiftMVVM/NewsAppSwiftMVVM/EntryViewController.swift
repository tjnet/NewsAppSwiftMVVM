//
//  File.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/09/22.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController, UIWebViewDelegate {
    
    lazy var url: NSURL = NSURL()
    
    @IBOutlet weak var contentWeb: UIWebView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        contentWeb.delegate = self
        contentWeb.loadRequest(NSURLRequest(URL: url))
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentWeb.delegate = self
    }
    
    
    
}