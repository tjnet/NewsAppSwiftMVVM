//
//  TableViewController.swift
//  NewsAppSwiftMVVM
//
//  Created by TanakaJun on 2016/05/11.
//  Copyright © 2016年 edu.self. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxAlamofire
import SafariServices

class TableViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    private let bag = DisposeBag()
    var entryList: [Entry]  = []
    
    // create ViewModel
    let viewModel = EntriesViewModel()
    
    init(nibName: String, title: String) {
        super.init(nibName: nibName, bundle: nil)
        self.title = title
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.registerNib(UINib(nibName: "EntryTableViewCell", bundle: nil), forCellReuseIdentifier: "EntryTableViewCell")
        
        viewModel.reloadData(self.title!)
        
        // see http://yannickloriot.com/2016/01/make-uitableview-reactive-with-rxswift/
        // bind articles to UITableView
        
        // If there is a `drive` method available instead of `bindTo`,
        // that means that the compiler has proven that all properties
        // are satisfied.
        viewModel.entries.drive(self.tableView.rx_itemsWithCellIdentifier("EntryTableViewCell")) {
            (index, entry: Entry, cell:EntryTableViewCell) in
            cell.updateCell(entry)
        }.addDisposableTo(bag)
        
        viewModel.entries.driveNext { [unowned self] in
            self.entryList = $0
        }.addDisposableTo(bag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        struct Cell {
            static var cell = UINib(nibName: "EntryTableViewCell", bundle: nil).instantiateWithOwner(nil, options: nil).first as! EntryTableViewCell
        }
        
        Cell.cell.setNeedsLayout()
        Cell.cell.layoutIfNeeded() //crucial after changng autolayout constraint
        
        return 120
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let entry = self.entryList[indexPath.row]
        let svc = SFSafariViewController(URL: NSURL(string: entry.link)!)
        self.presentViewController(svc, animated: true, completion: nil)
        
        reloadRowsAtIndexPath(indexPath)
    }
    
    
    func reloadRowsAtIndexPath(indexPath: NSIndexPath) {
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }

    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.contentView.alpha = 0
        UIView.animateWithDuration(NSTimeInterval(0.8), animations: {
            cell.contentView.alpha = 1
        })
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.frame.size.width = self.view.bounds.width
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
